package dto.get;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Date;


@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString

public class OrderDTOGet {
    private int id;
    private String userName;
    private Date order_date;
    private Double amount;
    private String status;
}
