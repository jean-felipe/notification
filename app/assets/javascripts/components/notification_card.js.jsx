var NotificationCard = React.createClass({
	propTypes:{
		notification_type: React.PropTypes.string,
		notification_content: React.PropTypes.string,
	},

  render: function() {
    return (

    	<div className="notification-panel">
          <div className='w3-card-4'>
            <header className='w3-container w3-blue'>
              <h3>{this.props.notification_type}</h3><h6>{this.props.created_at}</h6>
            </header>
            <div className='w3-container w3-light-grey'>
              <strong>Observações:</strong>
              <p>{this.props.notification_content}</p>
            </div>
            <footer className='w3-container w3-dark-grey'>
              <h5>Responder Confirmar</h5>
            </footer>
           </div>
       </div>
    	);
  }
});


 