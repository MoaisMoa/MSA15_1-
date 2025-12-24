package board.DAO;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

public class BaseDAOImpl<T> {

    private static final String URL =
        "jdbc:mysql://localhost:3306/movie?serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    private Class<T> type;

    @SuppressWarnings("unchecked")
    public BaseDAOImpl() {
        this.type = (Class<T>)
            ((java.lang.reflect.ParameterizedType)
            getClass().getGenericSuperclass())
            .getActualTypeArguments()[0];
    }

    public T selectByPk(Object pk) {
        try {
            /* ================= 테이블 정보 ================= */
            Table table = type.getAnnotation(Table.class);
            if (table == null) {
                throw new RuntimeException("@Table 어노테이션이 없습니다.");
            }
            String tableName = table.value();

            /* ================= PK 필드 ================= */
            Field pkField = null;
            for (Field f : type.getDeclaredFields()) {
                if (f.isAnnotationPresent(Pk.class)) {
                    pkField = f;
                    break;
                }
            }

            if (pkField == null) {
                throw new RuntimeException("PK 필드를 찾지 못했습니다.");
            }

            String sql = "SELECT * FROM " + tableName +
                         " WHERE " + pkField.getName() + " = ?";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setObject(1, pk);

            ResultSet rs = ps.executeQuery();
            if (!rs.next()) return null;

            T obj = type.getDeclaredConstructor().newInstance();

            for (Field f : type.getDeclaredFields()) {
                f.setAccessible(true);
                Object value = rs.getObject(f.getName());
                if (value == null) continue;

                /* ===== int ===== */
                if (f.getType() == int.class && value instanceof Number) {
                    f.set(obj, ((Number) value).intValue());
                }
                /* ===== String 날짜 (🔥 핵심) ===== */
                else if (f.getType() == String.class &&
                        (value instanceof java.sql.Date
                        || value instanceof java.sql.Timestamp
                        || value instanceof LocalDateTime)) {
                    f.set(obj, value.toString());
                }
                /* ===== java.util.Date ===== */
                else if (f.getType() == java.util.Date.class) {
                    if (value instanceof java.sql.Date) {
                        f.set(obj, new java.util.Date(((java.sql.Date) value).getTime()));
                    } else if (value instanceof java.sql.Timestamp) {
                        f.set(obj, new java.util.Date(((java.sql.Timestamp) value).getTime()));
                    }
                }
                /* ===== 기타 ===== */
                else {
                    f.set(obj, value);
                }
            }

            return obj;

        } catch (Exception e) {
            System.out.println("🔥 BaseDAOImpl.selectByPk 오류");
            e.printStackTrace();
        }
        return null;
    }
}
