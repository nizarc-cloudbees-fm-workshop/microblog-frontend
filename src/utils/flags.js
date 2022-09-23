import Rox from 'rox-browser'

export const Flags = {
  sidebar: new Rox.Flag(false)
}

async function initCloudBees () {
  const options = {
  }

  Rox.register('default', Flags)
  await Rox.setup(process.env.VUE_APP_CLOUDBEES_KEY, options)
}

initCloudBees().then(function () {
  console.log('Done loading CloudBees Feature Management')
})
