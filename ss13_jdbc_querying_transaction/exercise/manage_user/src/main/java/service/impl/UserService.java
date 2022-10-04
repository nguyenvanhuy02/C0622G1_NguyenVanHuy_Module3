package service.impl;

import model.User;
import repository.UserRepository;
import service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private UserRepository UserRepository = new repository.impl.UserRepository();
    @Override
    public void insertUser(User user) throws SQLException {
        UserRepository.insertUser(user);
    }

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
