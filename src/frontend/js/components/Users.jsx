import React, { useEffect } from 'react'

const Users = () => {
  useEffect(() => {
    document.title = window.defaults.routes['/users'].title
  }, [])

  return (
    <div id='users'>
      <h1>Users</h1>

      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci ab aut obcaecati esse nihil laudantium cupiditate, consectetur vero, aliquam tempore placeat, dicta voluptatum officiis sed consequuntur et nam perspiciatis repellendus!</p>
    </div>
  )
}

export default Users
