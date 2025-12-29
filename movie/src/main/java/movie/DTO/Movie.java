package movie.DTO;

import java.util.Date;
import java.util.List;

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
    private int movieId;
    private String title;
    private String subTitle;
    private String director;
    private String actor;
    private String country;
    private Date releaseDate; // 2025/10/12
    private String description;
    private Date createdAt;
    private int playTime;
    private String imgPath;
    private String detailImgPath; // 유지

    
    // 장르 추가
    @Column(exist = false)
    private List<String> genres;
    
    // 계산된 평균 평점
    @Column(exist = false)
    private double averageRating;
}
