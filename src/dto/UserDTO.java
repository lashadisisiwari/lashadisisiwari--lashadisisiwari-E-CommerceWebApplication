package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class UserDTO {
    private String user_id;
    private String user_name;
    private String email;
    private String password;
    private String contact;
    private String type;
    private String status;
}
