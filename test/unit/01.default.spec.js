'use strict'

const {
  test,
  trait } = use('Test/Suite')('Sign Up')

trait('Test/ApiClient')

test('Servidor: deve retornar 200', async ({ assert, client }) => {
  const response = await client
    .get('/')
    .end()

  response.assertStatus(200)
})

test('Servidor: deve retornar um json { "greeting": "Hello world in JSON" }', async ({ assert, client }) => {
  const response = await client
    .get('/')
    .end()

  response.assertHeader('content-type', 'application/json; charset=utf-8')
  response.assertJSONSubset({
    greeting: 'Hello world in JSON'
  })
})
