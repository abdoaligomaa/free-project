import { User, UserProfile } from '../data/models';

export async function getItineraryUsersInfo(splitAndShareData) {
  if (splitAndShareData.length === 0) return splitAndShareData;
  const splitAndShareDataList = [...splitAndShareData];
  const emails = splitAndShareDataList.map(ls => ls.email);
  const users = await User.findAll({
    attributes: ['id', 'email'],
    where: {
      email: {
        $in: emails
      },
    },
    raw: true,
  });
  const usersIds = users.map(ls => ls.id);
  const usersProfiles = await UserProfile.findAll({
    attributes: ['userId', 'profileId', 'displayName', 'picture'],
    where: {
      userId: {
        $in: usersIds
      },
    },
    raw: true,
  });
  if (splitAndShareDataList.length > 0 && users.length > 0 && usersProfiles.length > 0) {
    for (let i = 0; i < splitAndShareDataList.length; i++) {
      const oneElement = splitAndShareDataList[i];
      const userIndex = users.findIndex(user => user.email === oneElement.email);
      if (userIndex >= 0) {
        const userId = users[userIndex].id;
        const userProfileIndex = usersProfiles.findIndex(usersProfile => usersProfile.userId === userId);
        if (userProfileIndex >= 0) {
          splitAndShareDataList[i].profileId = usersProfiles[userProfileIndex].profileId;
          splitAndShareDataList[i].profileName = usersProfiles[userProfileIndex].displayName;
          splitAndShareDataList[i].profileAvatar = usersProfiles[userProfileIndex].picture;
        }
      }
    }
  }
  return splitAndShareDataList;
}

export default {
  getItineraryUsersInfo,
};