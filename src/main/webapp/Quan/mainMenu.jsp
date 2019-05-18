<%@ include file="/core.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>思诚E-leaning教育平台</title>
    <link rel="stylesheet" href="/Quan/css/style.css" type="text/css" media="all"/>
    <script src="/Quan/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        //图片滚动 调用方法 imgscroll({speed: 30,amount: 1,dir: "up"});
        $.fn.imgscroll = function(o){
            var defaults = {
                speed: 40,
                amount: 0,
                width: 1,
                dir: "left"
            };
            o = $.extend(defaults, o);

            return this.each(function(){
                var _li = $("li", this);
                _li.parent().parent().css({overflow: "hidden", position: "relative"}); //div
                _li.parent().css({margin: "0", padding: "0", overflow: "hidden", position: "relative", "list-style": "none"}); //ul
                _li.css({position: "relative", overflow: "hidden"}); //li
                if(o.dir == "left") _li.css({float: "left"});

                //初始大小
                var _li_size = 0;
                for(var i=0; i<_li.size(); i++)
                    _li_size += o.dir == "left" ? _li.eq(i).outerWidth(true) : _li.eq(i).outerHeight(true);

                //循环所需要的元素
                if(o.dir == "left") _li.parent().css({width: (_li_size*3)+"px"});
                _li.parent().empty().append(_li.clone()).append(_li.clone()).append(_li.clone());
                _li = $("li", this);

                //滚动
                var _li_scroll = 0;
                function goto(){
                    _li_scroll += o.width;
                    if(_li_scroll > _li_size)
                    {
                        _li_scroll = 0;
                        _li.parent().css(o.dir == "left" ? { left : -_li_scroll } : { top : -_li_scroll });
                        _li_scroll += o.width;
                    }
                    _li.parent().animate(o.dir == "left" ? { left : -_li_scroll } : { top : -_li_scroll }, o.amount);
                }

                //开始
                var move = setInterval(function(){ goto(); }, o.speed);
                _li.parent().hover(function(){
                    clearInterval(move);
                },function(){
                    clearInterval(move);
                    move = setInterval(function(){ goto(); }, o.speed);
                });
            });
        };
        //友情链接下拉框跳转弹出新窗口
        function frlink(selObj){
            window.open(selObj.options[selObj.selectedIndex].value);}
    </script>


    <script>
        $(document).ready(function () {
            if($("#loginstate").val() == 1){
                $("#loginshow").show();
                $("#notloginshow").hide();
            }
            else {
                $("#loginshow").hide();
                $("#notloginshow").show();
            }

        })

    </script>


</head>

 <body>
<%-- <shiro :authenticated/>--%>
 <input type="hidden" id="loginstate" value="${sessionScope.memberUser.loginState}">
<div id="hearder2" class="clearfix">
    <div class="logo">
        <img src="images/head_seecen.png">
    </div>
   <div class="logo-name">思诚 e-leaning 教育平台</div>
    <div class="form-tools">

    </div>
</div>
<div id="menu-box" class="clearfix">
    <ul>
        <li><a href="/Quan/mainMenu.jsp">首页</a></li>
        <li><a href="/chat.do?method=friend&userId=${sessionScope.user.userId}&divId=myfriend">聊天交友</a></li>
        <li><a href="/forum.do?method=index">社区</a></li>
        <li><a href="/yuanj/stuManage/stuToTest.jsp">考试</a></li>
        <li><a href="/yuanh/writeNotes.jsp">学习</a></li>
        <li><a href="/Quan/aboutSeecen.jsp" target="_blank">关于思诚</a></li>
    </ul>

</div>
<div id="slider-box" style="background:url(images/slider2.jpg) center center;"></div>
<!-- div1 -->
<div id="div1" class="clearfix">
    <div id="loginshow" class="left260" style="display: none">
        <div class="title-box">学生登录</div>


            <div class="t-link">
                <span style="font-size: 15px"> 欢迎</span>
                <span style="color:green;font-size: 18px">${sessionScope.memberUser.username}</span>
                 <form action ="/sys/logout.do" method="post">
                     <input type="submit" name="logout" value="注销" class="input-but ">
                 </form>
                <form action ="${ctx}/backin.do">
                    <input type="hidden" name="username" value="${sessionScope.user.username}">
                    <input type="hidden" name="password" value="${sessionScope.user.password}">

                    <input type="submit" name="backMenu" value="进入后台" class="input-but ">
                </form>
            </div>
    </div>
    <div id="notloginshow" class="left260">
        <div class="title-box">学生登录</div>
         <div>您还未登录，请先登录</div>
        <input type="button" name="button2" value="登录" class="input-login" onClick="window.open('/Quan/login.jsp')">
        <input type="button" name="button" value="注册" class="input-but"  onClick="window.open('/Quan/register.jsp')">
    </div>
    <div class="center450">
        <div class="title-box">中心简介</div>
        <p><img src="images/p-img.jpg" align="left">江西思诚科技有限公司（以下简称“思诚科技”）(seecen)是一家面向企业、高等院校、大学生，提供信息技术咨询与人才服务的专业机构。公司业务范围涵盖软件产品研发、企业信息系统项目咨询、
            高校服务、软件人才定制岗前实训等方面。公司总部坐落于国家首批软件开发服务外包示范城市、中部地区软件产业基地和软件人才培养基地——南昌。<a href="/Quan/aboutSeecen.jsp" target="_blank">查看更多...</a></p>
    </div>
    <div class="right260">
        <ul>
            <li>
                <a target="_blank" href="detail2.html" title=""><img src="images/icon-1.png"></a><br />
                <a target="_blank" href="detail2.html" style="color:#d81e06;">官网首页</a>
            </li>
            <li>
                <a target="_blank" href="form2.html" title=""><img src="images/icon-2.png"></a><br />
                <a target="_blank" href="form2.html" style="color:#eda761;">NEW学堂</a>
            </li>
            <li>
                <a target="_blank" href="form2.html" title=""><img src="images/icon-3.png"></a><br />
                <a target="_blank" href="form2.html" style="color:#469892;">信息咨询</a>
            </li>
            <li>
                <a target="_blank" href="form2.html" title=""><img src="images/icon-4.png"></a><br />
                <a target="_blank" href="form2.html" style="color:#4094ac;">新闻中心</a>
            </li>
            <li>
                <a target="_blank" href="form2.html" title=""><img src="images/icon-5.png"></a><br />
                <a target="_blank" href="form2.html" style="color:#1c6dbf;">高校服务</a>
            </li>
            <li>
                <a  target="_blank" href="http://192.168.1.245:8080/shiro/login_test;JSESSIONID=bb270378-2da4-4613-9315-8ecbbf261844" title="考试系统"><img src="images/icon-6.png"></a><br />
                <a  target="_blank" href="http://192.168.1.245:8080/shiro/login_test;JSESSIONID=bb270378-2da4-4613-9315-8ecbbf261844" style="color:#86309f;">考试系统</a>
            </li>
            <li>
                <a  target="_blank" href="form2.html" title=""><img src="images/icon-7.png"></a><br />
                <a  target="_blank" href="form2.html" style="color:#d4237a;">合作伙伴</a>
            </li>
            <li>
                <a target="_blank" href="form2.html" title=""><img src="images/icon-8.png"></a><br />
                <a target="_blank" href="form2.html" style="color:#1a7355;">产品平台</a>
            </li>
            <li>
                <a target="_blank" href="form2.html" title=""><img src="images/icon-9.png"></a><br />
                <a target="_blank" href="form2.html" style="color:#d4237a;">创业创新</a>
            </li>
        </ul>
    </div>
</div>
<!-- div2 -->
<div id="div2" class="clearfix">
    <div class="left260">
        <div class="title-box">学员故事<a  target="_blank" href="http://www.scnew.com.cn/news/Special/xygs/Index.html" class="title-more">更多...</a></div>
        <ul>
            <li><a  target="_blank " href="http://www.scnew.com.cn/news/news_20180613101053.html ">0基础学java，如今工资竟然达到了5位数</a></li>
            <li><a  target="_blank " href="http://www.scnew.com.cn/news/news_20180511105941.html">你还在纠结代码,我在旁边抖腿</a></li>
            <li><a   target="_blank "href="http://www.scnew.com.cn/news/news_20180427141900.html">讲真，"钱多事少离家近"的工作还真的有</a></li>
            <li><a   target="_blank " href="http://www.scnew.com.cn/news/news_20180418155745.html">考研失败后，我来到了思诚</a></li>
            <li><a  target="_blank " href="http://www.scnew.com.cn/news/news_20180420095432.html">我不是学计算机的，也能做IT吗？</a></li>
            <li><a  target="_blank "  href="http://www.scnew.com.cn/a2/jymx1706-2lj.html">思诚NEW学堂实训营学院就业感言</a></li>
        </ul>
    </div>
    <div class="center450">
        <div class="tabbox">
            <div class="tab">
                <a href="http://www.seecen.com/news/List_4.html" class="on" target="_blank">公司新闻</a>
                <a href="http://www.seecen.com/news/Special/cpfw/Index.html" target="_blank">行业动态</a>
                <a href="http://www.seecen.com/news/List_1.html" target="_blank">产品服务</a>
            </div>
            <div class="content">
                <div style="display:block;" class="tb">
                    <ul>
                        <li><a  target="_blank"  href="http://www.seecen.com/news/news_20180717154533.html">南昌高新区人社局领导来思诚视察指导</a><span>2018-07-17</span></li>
                        <li><a  target="_blank" href="http://www.seecen.com/news/news_20180410142047.html">江西思诚科技参加中国计算机学会（CCF）南昌…</a><span>2018-09-18</span></li>
                        <li><a   target="_blank" href="http://www.seecen.com/news/news_20171222090158.html">思诚科技受邀参加2017云栖大会·北京峰会</a><span>2018-09-11</span></li>
                        <li><a   target="_blank" href="http://www.seecen.com/news/news_20171110154938.html">和思诚科技一起，跟着甲骨文“黑科技”创造…</a><span>2018-09-23</span></li>
                        <li><a   target="_blank" href="http://www.seecen.com/news/news_20171103134443.html">2017甲骨文云大会，和思诚科技一起，听创新…</a><span>2017-12-30</span></li>
                        <li><a   target="_blank" href="http://www.seecen.com/news/news_20170527150656.html">齐心攀高峰，我来自思诚”——思诚科技20…</a><span>2017-12-23</span></li>
                    </ul>
                </div>
                <div class="tb">
                    <ul>
                        <li><a  target="_blank" href="http://www.seecen.com/news/news_20180925110900.html">区块链+大数据，未来交通道路能否畅通无阻</a><span>2018-08-26</span></li>
                        <li><a  target="_blank" href="http://www.seecen.com/news/news_20180918104334.html">李开复：现在中国是数据石油时代的沙特阿拉…</a><span>2018-07-23</span></li>
                        <li><a  target="_blank" href="http://www.seecen.com/news/news_20180911093010.html">神州数码公布2018上半年业绩&nbsp;同比大涨26.62…</a><span>2018-06-14</span></li>
                        <li><a   target="_blank"href="http://www.seecen.com/news/news_20180830165916.html">阿里云安全三大核驱动:&nbsp;可信、智能、合规</a><span>2018-07-05</span></li>
                        <li><a  target="_blank" href="http://www.seecen.com/news/news_20180827104728.html">阿里钉钉亮相智博会，七大资本逾10亿资金赋…</a><span>2018-08-23</span></li>
                        <li><a  target="_blank" href="http://www.seecen.com/news/news_20180820104930.html">阿里巴巴牵手上海&nbsp;未来将把新业务新模式应用…</a><span>2018-08-23</span></li>
                    </ul>
                </div>
                <div class="tb">
                    <ul>
                        <li><a   target="_blank" href="http://www.seecen.com/news/news_20180622103037.html">别再说IT行业“吃青春饭”了！</a><span>2018-09-23</span></li>
                        <li><a  target="_blank"  href="http://www.seecen.com/news/news_20180403084309.html">思诚科技总结：投资银行最常问的10个Java面…</a><span>2018-09-21</span></li>
                        <li><a  target="_blank" href="http://www.seecen.com/news/news_20180307134721.html">深圳蓝凌软件股份有限公司3月双选会</a><span>2018-09-18</span></li>
                        <li><a   target="_blank" href="http://www.seecen.com/news/news_20170919101614.html">赞同科技9月招聘启示</a><span>2018-08-08</span></li>
                        <li><a   target="_blank" href="http://www.seecen.com/news/news_20170908102442.html">用友公司招聘人员启事</a><span>2018-07-17</span></li>
                        <li><a   target="_blank" href="http://www.seecen.com/news/news_20170904154605.html">北京易腾时代科技有限公司招聘结果公示</a><span>2018-06-24</span></li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <div class="right260">
        <div class="title-box">视频新闻<a href="list-pic2.html" class="title-more">更多...</a></div>
        <div class="video-box">
            <embed src='http://player.youku.com/player.php/sid/XMjUyNDc5MDYwMA==/v.swf' allowFullScreen='true' quality='high' width='260' height='150' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>
        </div>
        <ul>
            <li><a target="_blank" href="http://vo.youku.com/v_show/id_XOTkxMDg2NjQ=.html?spm=a2h0k.11417342.soresults.dtitle">IT发展和人才需求</a></li>
            <li><a target="_blank" href="https://v.youku.com/v_show/id_XNjI4ODE5Njk2.html?spm=a2h0k.11417342.soresults.dtitle">IT简历指导</a></li>


        </ul>
    </div>
</div>
<script>
    $(function(){
        $(".tabbox .tab a").mouseover(function(){
            $(this).addClass('on').siblings().removeClass('on');
            var index = $(this).index();
            number = index;
            $('.tabbox .content .tb').hide();
            $('.tabbox .content .tb:eq('+index+')').show();
        });

        var auto = 1;  //等于1则自动切换，其他任意数字则不自动切换
        if(auto ==1){
            var number = 0;
            var maxNumber = $('.tabbox .tab a').length;
            function autotab(){
                number++;
                number == maxNumber? number = 0 : number;
                $('.tabbox .tab a:eq('+number+')').addClass('on').siblings().removeClass('on');
                $('.tabbox .content .tb:eq('+number+')').show().siblings().hide();
            }
            var tabChange = setInterval(autotab,3000);
            //鼠标悬停暂停切换
            $('.tabbox').mouseover(function(){
                clearInterval(tabChange);
            });
            $('.tabbox').mouseout(function(){
                tabChange = setInterval(autotab,3000);
            });
        }
    });
</script>
<!-- div3 -->
<div id="div3"><img src="images/seecen.jpg"></div>
<div id="div4">
    <div class="title-box">设备资源</div>
</div>
<div class="scrollleft clearfix">
    <ul>
        <li>
            <a href="http://www.seecen.com/crm1.html" target="_blank"><img src="images/a1.png"/></a>
            <span>产品和平台</span>
        </li>
        <li>
            <a href="http://www.seecen.com/qyzx.html" target="_blank"><img src="images/a2.png"/></a>
            <span>企业信息咨询</span>
        </li>
        <li>
            <a href="http://www.seecen.com/oracle1.html" target="_blank"><img  src="images/a3.png"/></a>
            <span>关于oracle</span>
        </li>

    </ul>
</div>
<script type="text/javascript">
    $(document).ready(function(){

        $(".scrollleft").imgscroll({
            speed: 80,    //图片滚动速度
            amount: 0,    //图片滚动过渡时间
            width: 1,     //图片滚动步数
            dir: "left"   // "left" 或 "up" 向左或向上滚动
        });

    });
</script>
<!-- div5 -->
<div id="div5" class="clearfix">
    <div class="link-box">
        <span>友情链接：</span>
        <select onChange="frlink(this)" name="select" class="select-link">
            <option selected>--- 教育类网站 ---</option>
            <option value="http://www.veryhuo.com">烈火网</option>
            <option value="http://www.sina.com.cn">新浪网</option>
            <option value="http://www.163.com">网易</option>
        </select>
        <select onChange="frlink(this)" name="select" class="select-link">
            <option selected>--- 政府类网站 ---</option>
            <option value="http://www.china.com"></option>
            <option value="http://www.sina.com.cn">新浪网</option>
            <option value="http://www.163.com">网易</option>
        </select>
        <select onChange="frlink(this)" name="select" class="select-link">
            <option selected>--- 校园类网站 ---</option>
            <option value="http://www.ncu.edu.cn/">南昌大学官网</option>
            <option value="http://www.nit.edu.cn/">南昌工程学院官网</option>
            <option value="http://www.ecit.edu.cn/">东华理工大学官网</option>
        </select>
        <select onChange="frlink(this)" name="select" class="select-link">
            <option selected>--- 其它类网站 ---</option>
            <option value="http://www.ncrczpw.com/">南昌人才招聘网</option>
            <option value="https://www.51job.com/">51job网</option>
            <option value="https://www.zhaopin.com/">智联招聘</option>
        </select>
    </div>
</div>
<div id="div6">Copyright &copy; 2018 南昌思诚科技有限公司 All rights reserved.</div>
</body>
</html>

