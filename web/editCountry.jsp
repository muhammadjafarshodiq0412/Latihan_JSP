<%-- 
    Document   : editCountry
    Created on : 17 Des 19, 14:40:49
    Author     : ASUS
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.Region"%>
<%@page import="java.util.List"%>

<form action="countryServlet?action=update" method="post" class="form-horizontal">
   <div class="form-group">
        <label>ID</label>
        <input class="form-control" class="au-input au-input--full" type="text" name="countryId" id="countryId" value="<%= request.getAttribute("countryId")%>" readonly>
    </div>
    <div class="form-group">
        <label>Country</label>
        <input class="au-input au-input--full" type="text" name="countryName" id="countryName" value="<%= request.getAttribute("countryName")%>" placeholder="Country Name">
    </div>
   <div class="form-group">
        <label>Region</label>
        <% List<Region> regions = (ArrayList<Region>) request.getAttribute("regions");%>
        <select class="form-control" name="regionId" id="regionId">
            <option value="<%= request.getAttribute("regionId")%>">
                <%= request.getAttribute("regionId")%> - <%= request.getAttribute("regionName")%>
            </option>

            <option>----------------</option>

            <%for (Region region : regions) {%>
            
            <option value="<%= region.getRegionId()%>">
                <%= region.getRegionId()%> - <%= region.getRegionName()%>
            </option>
            <% }%>
        </select>
    </div>
        
    <center>
        <button class="btn btn-primary" type="submit" name="submit"><i class="fas fa-save"></i> Save</button>
        <!--<input type="submit" name="submit" value="Save" class="btn btn-primary"/>-->
        <a href="countryServlet?action=list" class="btn btn-secondary" data-dismiss="modal">Cancel</a>
    </center>
</form>