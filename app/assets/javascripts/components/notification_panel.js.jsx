var NotificationPanel = React.createClass({

	getInitialState: function(){

		console.log('getInitialState');
		this.getDataFromApi();
		return { notificationList: []}
	},

	componentDidMount: function(){

		console.log('componentDidMount');
		this.getDataFromApi();
	},

	getDataFromApi: function(){
		console.log('getDataFromApi');
		var self = this;
		JQuery.ajax({
			method: 'GET',
			url: '/notifications.json',
			success: function(data){
				self.setState({ notificationList: data });
			},
			error: function(xhr, status, error){
				alert('Error in getting data from endpoint:', error);
			}
		});
	},

  render: function() {
  	console.log('render');
  	var notifications = [];
  	this.props.notifications.forEach(function(notification){
  		notifications.push(<NotificationCard 
  												created_at= {notification.creation} 
  												notification_type={notification.notification_type} 
  												notification_content={notification.content}
  												key={notificatoin.id} />);
  	}.bind(this));

    return (
				<tbody data-behavior="notification-panel">
				  {this.props.notifications}
				</tbody>
    );
  }
});
