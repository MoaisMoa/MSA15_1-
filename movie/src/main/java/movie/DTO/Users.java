package movie.DTO;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("users")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Users {

    @Pk
    private int user_id;

    private String username;

    private String password;

    private String role;

    private Date created_at;

    private String gender;

    private String email;

    private String user_img_path;
}
