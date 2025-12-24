package board.DTO;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("movie")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Movie {

    @Pk
    private int movie_id;
    private String title;
    private String sub_title;
    private String director;
    private String actor;
    private String country;
    private String release_date;
    private String description;
    private String created_at;
    private String img_path;
    private int play_time;
    private String detail_img_path; // 유지
}

