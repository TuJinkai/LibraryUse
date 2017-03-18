package lib.imgUpdate;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartFile;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.jxnu.lib.Connecting_To_Database;

@WebServlet("/UploadUserImgs")
public class UploadUserImgsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO 自动生成的方法存根
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String User_Id = req.getSession().getAttribute("Id").toString();
		
		SmartUpload su = new SmartUpload();
		su.initialize(getServletConfig(),req, resp);//初始化插件		
		try {
			su.upload();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		 //操作		 
			  su.setAllowedFilesList("jpg");//设置允许格式
			  try {
				for (int i=0;i<su.getFiles().getCount();i++)
				{
					SmartFile file = su.getFiles().getFile(i);		
					// 若文件不存在则继续
					if (file.isMissing()) continue;
					file.saveAs("images/User_imgs/"+User_Id+".jpg",SmartUpload.SAVE_VIRTUAL);//这个su.SAVE_VIRTUAL代表设置参数，相对路径保存，根目录为tomcat下webapp的项目文件夹。
					System.out.println("图片修改：successful");
					PathUpdate(User_Id);//更新路径（更新原始路径demo）
					resp.sendRedirect("ShowUserInfo");
					
				}
			} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	}
	
	//更新路径（更新原始路径demo）
	protected void PathUpdate(String User_Id){
		
		try {
			Connection conn = Connecting_To_Database.getConnection();
			String sql = "update user set Img=? where Id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "images/User_imgs/"+User_Id+".jpg");
			ps.setString(2, User_Id);
			ps.executeUpdate();
			ps.close();
			conn.close();
			System.out.println("图片路径更新成功");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("图片路径更新失败！！！");
		}
		
	}
	

}
