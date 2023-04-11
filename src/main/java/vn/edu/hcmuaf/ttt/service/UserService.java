package vn.edu.hcmuaf.ttt.service;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DBConnect;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;
import vn.edu.hcmuaf.ttt.model.Category;
import vn.edu.hcmuaf.ttt.model.Product;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class UserService {
    private static UserService instance;


    private static Map<String, String> users = new HashMap<>();
    static {
        users.put("admin", "admin");
        users.put("user", "user");
        users.put("ti", "123");
    }

    private UserService(){

    }

    public static UserService getInstance(){
        if(instance == null){
            instance = new UserService();

        }
        return instance;
    }
    //Phương thức để đăng nhập
    public  static User checkLogib(String user_name, String user_password){
        List<User> users = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM `user` WHERE user_name = ? AND user_password = ?").bind(0,user_name).bind(1,user_password).mapToBean(User.class).stream().collect(Collectors.toList())
        );
        if(users.size() != 1) return null;
        User user = users.get(0);
        return user;
    }



//Phương thức ktra user_name có bị trùng hay không khi đăng ký
    public  static User checkExist(String user_name){
        List<User> users = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM `user` WHERE user_name = ?").bind(0,user_name).mapToBean(User.class).stream().collect(Collectors.toList())
        );
        if(users.size() != 1) return null;
        User user = users.get(0);
        return user;
    }

  
//Phuong thức cho đăng ký
    static public  void singup(String user_fullname, String user_name, String accout, String user_email,String user_sdt, String user_password){
       JDBiConnector.me().withHandle(h ->
               h.createUpdate("INSERT INTO `user` VALUES (null,?,?,?,?,?,?, 0)")
                .bind(0, user_name)
                .bind(0, user_fullname)
                .bind(1, user_name)
                .bind(2, accout)
                .bind(3, user_email)
                .bind(4, user_sdt)
                .bind(5, user_password)
                .execute());

    }




   static public User findByUserNameAndEmail(String user_email) {
       return JDBiConnector.me().withHandle(handle -> {
           return handle.createQuery(" SELECT * FROM `user` WHERE user_email = ?")
                   .bind(0, user_email)

                   .mapToBean(User.class).first();


       });





    }

public static User findByUserAndEmail(String user_name, String user_email){
    List<User> userList = JDBiConnector.me().withHandle(h ->
            h.createQuery("SELECT * FROM `user` WHERE user_name =? AND user_email =?")
                    .bind(0,user_name)
                    .bind(1, user_email)
                    .mapToBean(User.class).stream().collect(Collectors.toList())
    );
  if(userList.size() == 0) return null;
  return userList.get(0);
}




    //cập nhật tài khoản người dùng
    static  public  void  updateFull_name(String user_fullname,String user_name, String account, String user_email, String user_sdt, String user_pass, String user_id){
        JDBiConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE `user` SET user_fullname = ?,user_name = ?, account = ?,user_email = ?, user_sdt = ?, user_password =? WHERE user_id = ?;")
                        .bind(0,user_fullname)
                        .bind(1,user_name)
                        .bind(2,account)
                        .bind(3,user_email)
                        .bind(4,user_sdt)
                        .bind(5,user_pass)
                        .bind(6,user_id).execute());
    }

    static  public User checkPassword(String user_name){
       return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT user_password FROM `user` WHERE user_name = ?")
                    .bind(0, user_name).mapToBean(User.class).first();
        });
    }

    //lấy thông tin user bằng google
    static public  void singupGoogle(String user_name, String user_email, String user_pass){
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO `user` VALUES (null,?,?,0,?,0,?,0)")
                        .bind(0,user_email)

                        .bind(1, user_name)
                        .bind(2, user_email)
                        .bind(3, user_pass)
                        .execute());

    }













    public static void main(String[] args) {
        UserService.singupGoogle("117750417231575822567", "20130431@st.hcmuaf.edu.vn", "1234");

    }

}
