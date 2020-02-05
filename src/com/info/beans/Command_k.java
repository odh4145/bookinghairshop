package com.info.beans;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command_k {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
