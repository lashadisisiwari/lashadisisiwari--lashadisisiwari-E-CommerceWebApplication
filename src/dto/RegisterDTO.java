package dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class RegisterDTO {
    private String Name;
    private String address;
    private String contact;
    private String gender;
    private String email;
    private String password;
    private String confirm;



}
