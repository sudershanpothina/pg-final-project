package com.spothi.frontend;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.platform.runner.JUnitPlatform;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
@RunWith(JUnitPlatform.class)
class FrontEndApplicationTests {
	@InjectMocks
	Controller controller;

	@Mock
	Repository repository;

	@Test
	public void testReturnAll() {
		MockHttpServletRequest request = new MockHttpServletRequest();
		RequestContextHolder.setRequestAttributes(new ServletRequestAttributes(request));

		// user 1
		User user1 = new User();
		user1.setName("user1");
		user1.setEmail("user1@gmail.com");


		//user 2
		User user2 = new User();
		user2.setName("user1");
		user2.setEmail("user1@gmail.com");

		// list all users
		List<User> userList = new ArrayList<>();
		userList.add(user1);
		userList.add(user2);

		//set repository
		when(repository.findAll()).thenReturn(userList);

		Iterable<User> resultUsers = controller.getAllUsers();
		int size =0;
		for (User user: resultUsers) {
			size++;
		}

		// check result size
		assertThat(size == 2);
	}

	@Test
	public void adduser() {
		MockHttpServletRequest request = new MockHttpServletRequest();
		RequestContextHolder.setRequestAttributes(new ServletRequestAttributes(request));
		User user1 = new User();
		user1.setName("user1");
		user1.setEmail("user1@gmail.com");

		when(repository.save(any(User.class))).thenReturn(user1);

		User responseUser = controller.addUser("user1", "user1@gmail.com");
		System.out.println(responseUser);

	}

}
