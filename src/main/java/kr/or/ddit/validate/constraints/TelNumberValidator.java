package kr.or.ddit.validate.constraints;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class TelNumberValidator implements ConstraintValidator<TelNumber, String>{
	
	private TelNumber annotation;
	
	@Override
	public void initialize(TelNumber constraintAnnotation) {
		this.annotation = constraintAnnotation;
	}

	// 검증의 통과여부를 구현
	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		boolean valid = true;
		
		if(value!=null && value.trim().length()>0)
		valid = value.matches(annotation.regex());
		
		return valid;
	}
}