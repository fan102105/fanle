package com.itheima.dao;

import com.itheima.entity.Route;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

public interface IRouteDao {
    @Select("select * from tab_route where rname like \"%\"#{rname}\"%\" order by rid desc limit #{begin} , #{pageSize}")
    List<Route> findRoutes(@Param("begin") int begin, @Param("pageSize") int pageSize, @Param("rname") String rname);

    @Select("select count(1) from tab_route where rname like \"%\"#{rname}\"%\"")
    int findTotalCounts(String rname);

    @Insert("insert into tab_route values (null,#{rname},#{price},#{routeIntroduce},#{rflag},#{rdate},#{isThemeTour},#{count},#{cid},#{rimage},#{sid},null)")
    void saveRoute(Route route);

    @Select("select * from tab_route where rid = #{rid}")
    Route findRouteByRid(String rid);

    void delRouteByRid(String[] rid);

    @Update("update tab_route set rname = #{rname} , price = #{price} , rflag = #{rflag} ,routeIntroduce = #{routeIntroduce} , cid = #{cid} , sid = #{sid}")
    void updateRoute(Route route);
}
