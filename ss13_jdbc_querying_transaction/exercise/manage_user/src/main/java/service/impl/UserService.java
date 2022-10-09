package service.impl;

import model.User;
import repository.UserRepository;
import service.IUserService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserService implements IUserService {
    private UserRepository UserRepository = new repository.impl.UserRepository();
    @Override
    public void insertUser(User user) throws SQLException {
        UserRepository.insertUser(user);
    }

//    @Override
//    public Map<String, String> insertUser(User user) throws SQLException {
//        Map<String,String> errorMap = new HashMap<>();
//        if ("".equals(user.getEmail())) {
//            errorMap.put("email", "Email không được để trống!!");
//        }
//        if (errorMap.size()==0){
//            boolean check= UserRepository.insertUser(user);
//        }
//        return null;
//    }

    @Override
    public User selectUser(int id) {
        return UserRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return UserRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return UserRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return UserRepository.updateUser(user);
    }

    @Override
    public List<User> findByCountry(String country) {
        return UserRepository.findByCountry("%" + country + "%");
    }
}
