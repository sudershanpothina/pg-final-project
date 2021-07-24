package com.spothi.frontend;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Controller
 */
@RestController
public class Controller {
    @Autowired
    Repository userRepository;

    @GetMapping(value = "/health")
    public String getHealth() {
        return "healthy";
    }

    @PostMapping(value = "/add")
    public User addUser(@RequestParam String name, @RequestParam String email) {
        User newUser = new User();
        newUser.setName(name);
        newUser.setEmail(email);
        userRepository.save(newUser);
        return newUser;
    }
    @GetMapping(value = "/")
    public Iterable<User> getAllUsers() {
        return userRepository.findAll();
    }
}