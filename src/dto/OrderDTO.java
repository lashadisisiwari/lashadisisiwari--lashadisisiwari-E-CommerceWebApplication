package dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Date;



@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString

public class OrderDTO {
private int id;
private Date date;
private String status;
private Double amount;


}
