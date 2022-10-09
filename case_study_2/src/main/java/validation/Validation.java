package validation;

public class Validation {
    public static boolean checkEmail(String email){
        String regexEmail = "[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)";
        return email.matches(regexEmail);
    }
    public static boolean checkName(String name){
        String regexName = "^\\p{Lu}\\p{Ll}+(\\s\\p{Lu}\\p{Ll}+)*$";
        return name.matches(regexName);
    }
    public static boolean checkIdCard(String idCard){
        String regexCard = "[0-9]{12}";
        return idCard.matches(regexCard);
    }
    public static boolean checkPhone(String phone){
        String regexPhone = "[0][0-9]{9}";
        return phone.matches(regexPhone);
    }
}
