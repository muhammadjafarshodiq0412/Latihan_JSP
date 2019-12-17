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
        <input class="au-input au-input--full" type="text" name="countryId" id="countryId" value="<%= request.getAttribute("countryId")%>" readonly>
    </div>
    <div class="form-group">
        <label>Country</label>
        <input class="au-input au-input--full" type="text" name="countryName" id="countryName" value="<%= request.getAttribute("countryName")%>" placeholder="Country Name">
    </div>
    <div class="row form-group">
        <div class="col col-md-3">
            <label for="Postal Code" class=" form-control-label">Postal Code</label>
        </div>
        <div class="col-12 col-md-9">
            <input type="text" id="postalCode" value="<%= request.getAttribute("postalCode")%>" name="postalCode" placeholder="Enter Postal Code..." class="form-control" required="">
        </div>
    </div>
    <div class="row form-group">
        <div class="col col-md-3">
            <label for="City" class=" form-control-label">City</label>
        </div>
        <div class="col-12 col-md-9">
            <input type="text" id="city" value="<%= request.getAttribute("city")%>" name="city" placeholder="Enter City..." class="form-control" required="">
        </div>
    </div>
    <div class="row form-group">
        <div class="col col-md-3">
            <label for="stateProvince" class=" form-control-label">State Province</label>
        </div>
        <div class="col-12 col-md-9">
            <input type="text" id="stateProvince" value="<%= request.getAttribute("stateProvince")%>" name="stateProvince" placeholder="Enter State Province..." class="form-control">
        </div>
    </div>
   <div class="form-group">
        <label>Region</label>
        <% List<Region> regions = (ArrayList<Region>) request.getAttribute("regions");%>
        <select class="au-input au-input--full" name="regionId" id="regionId">
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