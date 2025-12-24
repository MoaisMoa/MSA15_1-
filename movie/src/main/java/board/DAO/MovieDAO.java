package board.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import board.DTO.Movie;

public class MovieDAO extends BaseDAOImpl<Movie> {
	

    // 기존 영화 단건 조회
    public Movie selectByPk(int movieId) {
        return super.selectByPk(movieId);
    }

    // 🔥 영화 장르 목록 조회 추가
    public List<String> selectGenresByMovieId(int movieId) {
        List<String> genres = new ArrayList<>();

        String sql = "SELECT genre FROM movie_genre WHERE movie_id = ?";

        try (
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/movie?serverTimezone=UTC",
                "root",
                "123456"
            );
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, movieId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                genres.add(rs.getString("genre"));
            }

        } catch (Exception e) {
            System.out.println("🔥 장르 조회 오류");
            e.printStackTrace();
        }

        return genres;
    }
}
