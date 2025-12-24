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
	private String movie_id;
	private String title;
	private String sub_title;
	private String director;
	private String actor;
	private String country;
	private String description;
	private Date created_at;
	private String img_path;
	private int play_time;
	private Date updated_at;


}
