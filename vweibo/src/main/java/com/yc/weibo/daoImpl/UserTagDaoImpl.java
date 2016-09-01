package com.yc.weibo.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.weibo.bean.UserTag;
import com.yc.weibo.dao.DBHelper;
import com.yc.weibo.dao.UserTagDao;

@Component
public class UserTagDaoImpl implements UserTagDao{
	@Autowired
	private DBHelper dbhelper;
	private String sql;
	
	@Override
	public List<UserTag> findAllUserTags() {
		sql = "select * from UserTag";
		return dbhelper.find(sql, null, UserTag.class);
	}

	@Override
	public int delUserTag(String tids) {
		sql = "delete from UserTag where UTid in ("+tids+")";
		return dbhelper.update(sql, null);
	}

	@Override
	public int addUserTag(String UTname) {
		sql = "insert into UserTag values (seq_ut_utid.nextval,?)";
		List<Object> params = new ArrayList<Object>();
		params.add(UTname);
		return dbhelper.update(sql, params);
	}

	@Override
	public int updateUserTag(Integer valueOf, String uTname) {
		sql = "update UserTag set UTname = ? where UTid = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(uTname);
		params.add(valueOf);
		return dbhelper.update(sql, params);
	}

}
