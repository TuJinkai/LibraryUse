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
		// TODO �Զ����ɵķ������
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String User_Id = req.getSession().getAttribute("Id").toString();
		
		SmartUpload su = new SmartUpload();
		su.initialize(getServletConfig(),req, resp);//��ʼ�����		
		try {
			su.upload();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		 //����		 
			  su.setAllowedFilesList("jpg");//���������ʽ
			  try {
				for (int i=0;i<su.getFiles().getCount();i++)
				{
					SmartFile file = su.getFiles().getFile(i);		
					// ���ļ������������
					if (file.isMissing()) continue;
					file.saveAs("images/User_imgs/"+User_Id+".jpg",SmartUpload.SAVE_VIRTUAL);//���su.SAVE_VIRTUAL�������ò��������·�����棬��Ŀ¼Ϊtomcat��webapp����Ŀ�ļ��С�
					System.out.println("ͼƬ�޸ģ�successful");
					PathUpdate(User_Id);//����·��������ԭʼ·��demo��
					resp.sendRedirect("ShowUserInfo");
					
				}
			} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	}
	
	//����·��������ԭʼ·��demo��
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
			System.out.println("ͼƬ·�����³ɹ�");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("ͼƬ·������ʧ�ܣ�����");
		}
		
	}
	

}
