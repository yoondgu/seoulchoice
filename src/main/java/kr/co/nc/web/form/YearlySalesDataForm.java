package kr.co.nc.web.form;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
@Alias("YearlySalesDataForm")
public class YearlySalesDataForm {

	private String salesMonth;
	private int salesPrice;
	
	public YearlySalesDataForm(String salesMonth, int salesPrice) {
		this.salesMonth = salesMonth;
		this.salesPrice = salesPrice;
	}
}
