import React from 'react';
import PropTypes from 'prop-types';
import Layout from '../layouts/Layout';
import Header from '../modules/Header';
import Body from '../modules/Body';
import Footer from '../modules/Footer';
import EmptySpace from '../modules/EmptySpace';
import { url, sitename } from '../../../config-sample';

class SubGuestShareReservation extends React.Component {
  static propTypes = {
    content: PropTypes.shape({
      id: PropTypes.string.isRequired,
      guest: PropTypes.string.isRequired,
      checkIn: PropTypes.string.isRequired,
      checkOut: PropTypes.string.isRequired,
      email: PropTypes.string.isRequired,
      logo: PropTypes.string.isRequired,
    }),
  };

  render() {
    const buttonStyle = {
      margin: 0,
      fontFamily: 'Arial',
      padding: '10px 16px',
      textDecoration: 'none',
      borderRadius: '2px',
      border: '1px solid',
      textAlign: 'center',
      verticalAlign: 'middle',
      fontWeight: 'normal',
      fontSize: '18px',
      whiteSpace: 'nowrap',
      background: '#ffffff',
      borderColor: '#ff5a5f',
      backgroundColor: '#ff5a5f',
      color: '#ffffff',
      borderTopWidth: '1px',
    };

    const textStyle = {
      color: '#484848',
      backgroundColor: '#F7F7F7',
      fontFamily: 'Arial',
      fontSize: '16px',
      padding: '35px',
    };

    const {
      content: { id, guest, checkIn, checkOut, email, logo },
    } = this.props;

    const itineraryUrl = url + '/users/trips/itinerary/' + id;

    return (
      <Layout>
        <Header color="#FF5A5F" backgroundColor="#F7F7F7" logo={logo} />
        <Body textStyle={textStyle}>
          <div>Hi {email},</div>

          <EmptySpace height={20} />

          <div>You have been invited to share {guest}'s trip</div>
          <div>
            Time {checkIn} - {checkOut}
          </div>

          <EmptySpace height={40} />

          <div>
            <a style={buttonStyle} href={itineraryUrl}>
              View Trip
            </a>
          </div>

          <EmptySpace height={30} />

          <div>
            Thanks, <br />
            The {sitename} Team
          </div>
        </Body>
        <Footer />
        <EmptySpace height={20} />
      </Layout>
    );
  }
}

export default SubGuestShareReservation;
