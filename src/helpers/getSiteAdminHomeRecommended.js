import { SiteSettings } from '../data/models';

export async function getSiteAdminHomeRecommended() {
  let recommendedSwap = false,
    recommendedRepost = false;
  const homeRecommendedSettings = await SiteSettings.findAll({
    attributes: ['name', 'value'],
    where: { type: 'homeRecommended_settings' },
    raw: true
  });
  if (homeRecommendedSettings.length > 0) {
    for (let i = 0; i < homeRecommendedSettings.length; i++) {
      const element = homeRecommendedSettings[i];
      if (element.name === 'recommendedSwap' && element.value === '1') recommendedSwap = true;
      if (element.name === 'recommendedRepost' && element.value === '1') recommendedRepost = true;
    }
  } 
  return {
    recommendedSwap,
    recommendedRepost
  }
}

export default {
  getSiteAdminHomeRecommended,
};
