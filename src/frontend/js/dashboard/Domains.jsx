import React, { useEffect, useContext } from 'react'

import { MainContext } from './../context/MainContext'
import connectApi from './common/connectApi'
import Page from './common/Page'

const Domains = props => {
  const { state, setState } = useContext(MainContext)

  const getDomains = async () => {
    const apiResults = await connectApi({
      meta: {
        category: 'domains',
        event: 'read'
      },
      data: {}
    })

    const domains = {}
    Object.keys(apiResults.data).map((key) => {
      const data = apiResults.data[key]
      domains[key] = data
      domains[key].title = domains[key].domain
      delete domains[key].domain
    })

    setState({ domains })
  }

  useEffect(() => {
    getDomains()
  }, [])

  const component = {
    singularId: 'domain',
    pluralId: 'domains',
    singularTitle: 'Domain',
    pluralTitle: 'Domains',
    newButton: true,
    data: state.domains
  }

  return (
    <Page
      {...props}
      component={component}
    />
  )
}

export default Domains
