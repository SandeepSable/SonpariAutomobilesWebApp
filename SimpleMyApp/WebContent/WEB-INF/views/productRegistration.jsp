<div class="generic-container">
	 	<form:form method="POST" modelAttribute="product" class="form-horizontal">
			
			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="productId">PRODUCT ID</label>
					<div class="col-md-7">
						<form:input type="text" disabled="disabled"  path="productId" id="productId" class="form-control input-sm"/>
					</div>
					<div class="has-error">
							<form:errors path="productId" class="help-inline"/>
						</div>
				</div>
			</div>
			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="productName">Product Name</label>
					<div class="col-md-7">
						<form:input type="text" path="productName" id="productName" class="form-control input-sm"/>
					</div>
					<div class="has-error">
							<form:errors path="productName" class="help-inline"/>
						</div>
				</div>
			</div>
	
			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="asliasName">Alias name</label>
					<div class="col-md-7">
						<form:input type="text" path="aliasName" id="aliasName" class="form-control input-sm" />
						
					</div>
					<div class="has-error">
							<form:errors path="aliasName" class="help-inline"/>
						</div>
				</div>
			</div>
	
			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="Description">DESCRIPTION</label>
					<div class="col-md-7">
						<form:input type="text" path="description" id="description" class="form-control input-sm" />
						
					</div>
					<div class="has-error">
							<form:errors path="description" class="help-inline"/>
						</div>
				</div>
			</div>
			
			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="manufacturer">PRODUCT_MANUFACTUERE </label>
					<div class="col-md-7">
						<form:input type="text" path="manufactuerer" id="manufactuerer" class="form-control input-sm" />
						
					</div>
					<div class="has-error">
							<form:errors path="manufacturer" class="help-inline"/>
						</div>
				</div>
			</div>
			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="warrenty">WARRENTY</label>
					<div class="col-md-7">
						<form:input type="text" path="warrenty" id="warrenty" class="form-control input-sm" />
					</div>
					<div class="has-error">
						</div>
				</div>
			</div>
			
			
			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="quantity">Is De-Activated</label>
					<div class="col-md-7">
						<form:input type="Checkbox" path="isDeactivated" id="isDeactivated" class="form-control input-sm" />
						
					</div>
					<div class="has-error">
							<form:errors path="isDeactivated" class="help-inline"/>
						</div>
				</div>
			</div>
	
		<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="price">Price</label>
					<div class="col-md-7">
						<form:input type="text" path="price" id="price" class="form-control input-sm" />
						
					</div>
					<div class="has-error">
							<form:errors path="price" class="help-inline"/>
						</div>
				</div>
			</div>
		
			<div class="column">
				<div class="form-actions floatRight">
					<c:choose>
						<c:when test="${edit}">
							<input type="submit" value="Update" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/' />">Cancel</a>
						</c:when>
						<c:otherwise>
							<input type="submit" value="Register" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/' />">Cancel</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</form:form>
	</div>