using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;


namespace sample
{
    public partial class history : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(
           WebConfigurationManager.ConnectionStrings["mydb"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bdisplay.Enabled = true;
            }
            
        }
        public void clear()
        {
            HiddenField1.Value = "";
            TextBox1.Text ="";
            lblsucessmessage.Text = lblerrormessage.Text = "";
            Bdisplay.Enabled = true;
            
        }
        
        protected void Bdisplay_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string Sql_Query = "select plant,section,equipment_no,equipment_desc,location_used,equipment_type,last_calib_done_on,due_date from equipment_master where equipment_no=@equipment_no";
            SqlCommand sqlcmd = new SqlCommand(Sql_Query, con);
            sqlcmd.Parameters.AddWithValue("@equipment_no", TextBox1.Text.Trim());
            sqlcmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            clear();
            con.Close();

            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                lblsucessmessage.Text = "DATA EXISTS";
                Bexcel.Enabled = true;
            }
            else
            {
                GridView1.DataSource = "";
                GridView1.DataBind();
                lblerrormessage.Text = "NO DATA....ENTER ANOTHER EQUIPMENT NUMBER...";
                Bexcel.Enabled = false;
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
        }
        protected void Bexcel_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=details.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using(StringWriter sw=new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                GridView1.AllowPaging = false;
                //this.bindgrid();
                GridView1.RenderControl(hw);
                string style = "<style>.textmode{ } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }
    }
}