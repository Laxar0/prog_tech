import unittest
import main as app
class TestMyRowsApp(unittest.TestCase):
    def setUp(self):
        self.app = app

    def test_transform(self):
        self.assertEqual(app.transform_into_my_format('a book'), '6:a book')
        self.assertEqual(app.transform_into_my_format(''), '0:')
        self.assertRaises(ValueError, self.app.transform_into_my_format, "qwertyuiop")

    def test_support(self):
        self.assertFalse (app.support_my_format('a book'))
        self.assertTrue (app.support_my_format('2:is'))

    def test_concat(self):
        s1 = ["1:a", "0"]
        s2 = ["4:book", "0"]
        res = ['5:abook', '0:']
        for i in range (0, len (res)):
            self.assertEqual (app.concat(s1[i],s2[i]), res[i])

    def tearDown(self):
        pass
if __name__ == '__main__':
    unittest.main()