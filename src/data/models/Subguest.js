import DataType from 'sequelize';
import Model from '../sequelize';

const Subguest = Model.define('Subguests', {
    id: {

        type: DataType.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,

    },
    email: {
        type: DataType.STRING,
        allowNull: true
    },

    reservationId: {
        type: DataType.INTEGER,
        allowNull: true
    },

    userId: {
        type: DataType.STRING,
        allowNull: true
    },
});

export default Subguest;