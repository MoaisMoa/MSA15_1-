package movie.DTO;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("review")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Review {

    @Pk
    private int reviewId;
    private String content;
    private int rating;
    private Date createdAt;
    private Date updatedAt;
    private int movieId;
    private int userId;

    @Column(exist = false)
    private String username;
}
