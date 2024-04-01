package kr.or.ddit.validate.constraints;

import static java.lang.annotation.ElementType.*; // 미리 임포트 해놓음

import java.lang.annotation.Retention;
import static java.lang.annotation.RetentionPolicy.*;
import java.lang.annotation.Target;

import javax.validation.Constraint;

@Target(FIELD) // 전역으로 사용할 수 있는 어노테이션으로 만듦
@Retention(RUNTIME) // 어노테이션을 언제까지 실행할지 정함
@Constraint(validatedBy = TelNumberValidator.class)
public @interface TelNumber {
	String regex() default "\\d{3}-\\d{3,4}-\\d{4}"; // 새로운 속성 추가 default는 기본값
	String message() default "{kr.or.ddit.validate.constraints.TelNumber.message}";
	Class<?>[] groups() default {};
	Class<?>[] payload() default {};
}
