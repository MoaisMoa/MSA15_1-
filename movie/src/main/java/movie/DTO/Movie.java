package movie.DTO;

import java.util.Date;
import java.util.List;

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
    private Date releaseDate;		
    private String description;
    private Date createdAt;
    private int playTime;
    private String imgPath;
    private String detailImgPath; 
    
	private List<Genre> genres;
}

