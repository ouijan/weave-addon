describe('Busted unit testing framework', function()
  it('should be easy to use', function()
    assert.truthy('Yup.')
  end)

  describe('asserts', function()
    it("checks if they're equals", function()
      local expected = 1
      local obj = expected
      assert.are.equals(expected, obj)
    end)

    it("checks if they're the same", function()
      local expected = { name = "Jack" }
      local obj = { name = "Jack" }

      assert.are.same(expected, obj)
    end)

    it("checks true", function()
      assert.is_true(true)
      assert.is.not_true("Yes")
      assert.is.truthy("Yes")
    end)

    it("checks false", function()
      assert.is_false(false)
      assert.is.not_false(nil)
      assert.is.falsy(nil)
    end)
  end)

  describe("spies", function()
    it("registers a new spy as a callback", function()
      local s = spy.new(function() end)
      s(1, 2, 3)
      s(4, 5, 6)
      assert.spy(s).was.called()
      assert.spy(s).was.called(2) -- twice!
      assert.spy(s).was.called_with(1, 2, 3) -- checks the history
    end)

    it("replaces an original function", function()
      local t = {
        greet = function(msg) return msg end
      }
      local s = spy.on(t, "greet")
      t.greet("Hey!") -- prints 'Hey!'
      assert.spy(t.greet).was_called_with("Hey!")
      t.greet:clear()   -- clears the call history
      assert.spy(s).was_not_called_with("Hey!")
      t.greet:revert()  -- reverts the stub
      t.greet("Hello!") -- prints 'Hello!', will not pass through the spy
      assert.spy(s).was_not_called_with("Hello!")
    end)
  end)


  describe("stubs", function()
    it("replaces an original function", function()
      local t = {
        greet = function(msg) return msg end
      }
      stub(t, "greet")
      t.greet("Hey!") -- DOES NOT print 'Hey!'
      assert.stub(t.greet).was.called_with("Hey!")
      t.greet:revert()  -- reverts the stub
      t.greet("Hey!") -- DOES print 'Hey!'
    end)
  end)

  describe("mocks", function()
    it("replaces a table with spies", function()
      local t = {
        thing = function(msg) return msg end
      }
      local m = mock(t) -- mocks the table with spies, so it will print
      m.thing("Coffee")
      assert.spy(m.thing).was.called_with("Coffee")
    end)

    it("replaces a table with stubs", function()
      local t = {
        thing = function(msg) return msg end
      }
      local m = mock(t, true) -- mocks the table with stubs, so it will not print
      m.thing("Coffee")
      assert.stub(m.thing).was.called_with("Coffee")
      mock.revert(m) -- reverts all stubs/spies in m
      m.thing("Tea") -- DOES print 'Tea'
    end)
  end)
end)
