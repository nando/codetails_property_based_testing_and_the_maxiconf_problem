center <<-EOS
  \e[1mProperty-based Testing\e[0m

  \e[1m+\e[0m

  \e[1mThe Maxiconf Problem\e[0m

  @nando_chistaco
  ©TCK Codetails 2019
EOS

block <<-EOS
  \e[1mÍNDICE\e[0m
  \e[1m──────────────────────────────────────\e[0m
  Property-based testing: \e[1mFast intro\e[0m_g+3
  PBT: \e[1mSearching our properties\e[0m_____g+11
  PBT en \e[1mRuby: Rantly\e[0m_______________g+22
  PBT en \e[1mPHP: Eris\e[0m__________________g+29
  PBT en \e[1mElixir: StreamData\e[0m_________g+34
  PBT en \e[1mPython: Hypothesis\e[0m_________g+40
  Extra ball: \e[1mThe Maxiconf Problem\e[0m__g+44
  Dedicatory: \e[1mMike Waters\e[0m:___)______g+51
EOS

section "Property-based testing: \e[1mFast intro\e[0m" do

  center <<-EOS
    \e[1mGeneración

    "automágica"\e[0m

    de los

    \e[1mdatos de entrada\e[0m

    utilizados

    \e[1men nuestros tests\e[0m.
  EOS

  block <<-EOS
    \e[31;1mMAGIC\e[0m => \e[1mGENERATORS\e[0m
                  +
              \e[1mSHRINKING\e[0m
  EOS

  block <<-EOS
    Origen: librería \e[1mQuickCheck\e[0m
    Año: 1999
    Lenguaje: \e[1mHaskell\e[0m
    Autores: Koen Claessen y John Hughes
    Portada a unos... \e[1m¡40 lenguajes!\e[0m
  EOS


  center <<-EOS
    Un \e[1mconcepto\e[0m nos
    da la idea:

     \e[1mExamples-based\e[0m
     Testing
     (clásico)

    VS

    \e[1mProperty-based\e[0m
    Testing
  EOS

  center <<-EOS
    \e[1m@ScottWlaschin\e[0m's \e[1mEDFH\e[0m:

    (the)\e[1m
    Enterprise
    Developer
    From
    Hell\e[0m

    (The lazy programmer's
    guide to writing
    1000s of tests)
  EOS

  center <<-EOS
    \e[1mCONVIVEN FELICES\e[0m
    ────────────────────────────────
    en realidad las
    \e[1mpruebas de testing clásico\e[0m
    vienen a probar
    un \e[1msubconjunto\e[0m de las
    \e[1mpruebas basadas
 en propiedad...\e[0m
  EOS

  center <<-EOS
    El decorador \e[1m@example\e[0m

    de \e[1mHypothesis\e[0m (Python)

    permite lanzar tests

    con \e[1mejemplos concretos\e[0m.

    (edge cases, entradas
     interesantes, etc.)
  EOS

  center <<-EOS
    Nos acerca a

    \e[1mla +esencia+\e[0m

    más que a

    \e[1mla -lógica-\e[0m

    de nuestra
    aplicación.
  EOS
end

section "PBT: \e[1mSearching our properties\e[0m" do

  center <<-EOS
    ───────────────────────────
    1
    ───────────────────────────

    Different paths,

    same destination

    ───────────────────────────
  EOS

  block <<-EOS
    ┌─────────────┐     \e[31;1mdo Y\e[0m    ┌───────────┐
    │    ? ? ?    ├────────────>│   1 2 3   │
    └─────────────┘             └───────────┘
           ^                          ^
           │ \e[31;1mdo X\e[0m                     │ \e[31;1mdo X\e[0m
           │                          │
    ┌──────┴──────┐     \e[31;1mdo Y\e[0m    ┌─────┴─────┐
    │    A B C    ├────────────>│   ? ? ?   │
    └─────────────┘             └───────────┘
  EOS

  block <<-EOS
    Fuente: Scott Wlaschin's blog
      (\e[1m“F# for Fun and Profit”\e[0m)

    => \e[1m“Choosing properties for
        property-based testing.”\e[0m

  EOS

  center <<-EOS
    ───────────────────────────
    2
    ───────────────────────────

    There and back again

    (code+decode)

    ───────────────────────────
  EOS

  center <<-EOS
    ───────────────────────────
    3
    ───────────────────────────

    Some things never change

    (invariant preserved)

    ───────────────────────────
  EOS

  center <<-EOS
    ───────────────────────────
    4
    ───────────────────────────

    The more things change,

    the more they stay the same

    (indempotencia)

    ───────────────────────────
  EOS

  center <<-EOS
    ─────────────────────────────
    5
    ─────────────────────────────

    Solve a smaller problem first

    ─────────────────────────────
  EOS

  center <<-EOS
    ───────────────────────────
    6
    ───────────────────────────

    Hard to prove...

    but easy to verify!!

    ───────────────────────────
  EOS

  center <<-EOS
    ───────────────────────────
    7
    ───────────────────────────

    The test oracle:

    alternative version

    ───────────────────────────
  EOS

end

section "PBT en Ruby: \e[1mRantly\e[0m" do
  center <<-EOS
    \e[1m“maxibon”\e[0m

    repos en

    \e[1mgithub.com/nando\e[0m
  EOS

  center <<-EOS
    nando/\e[1mMaxibonKataRuby\e[0m
  EOS

  block <<-EOS
    en nuestro \e[31;1mtest/test_helper.rb\e[0m:
    ────────────────────────────────────

    require '\e[1mrantly/minitest_extensions\e[0m'

    o

    require '\e[1mrantly/rspec_extensions\e[0m'
  EOS

  block <<-EOS
    describe \e[1mDeveloper\e[0m do
      it "should return her/his name" do
        \e[1mproperty_of {
          string(class=:print)
        }.check { | name |
          dev = Developer.new( name )
          dev.name.must_equal name
        }\e[0m
      end
    end
  EOS

  block <<-EOS
    Generador(*)
    ───────────────────────────────
    def unpredicteble_developer
      Developer.new(\e[1mstring\e[0m,
                    \e[1minteger\e[0m)
    end

    *: definido (o requerido) en
       \e[31;1mtest/test_helper.rb\e[0m.
  EOS

  block <<-EOS
    describe \e[1mDeveloper\e[0m do
      it "should always grab positive maxibons" do
        \e[1mproperty_of {
          unpredicteble_developer
        }.check { | dev |
          dev.maxibonsToGrab.must :>=, 0
        }\e[0m
      end
    end
  EOS

end

section "PBT en PHP: \e[1mEris\e[0m" do
  center <<-EOS
    nando/\e[1mMaxibonKataPhp\e[0m
  EOS

  block <<-EOS
    en nuestro \e[31;1mcomposer.json\e[0m:
    ────────────────────────────────────
    {
        "autoload": {
            "classmap": [
                "src/"
            ]
        },
        "require-dev": {
            \e[1m"giorgiosironi/eris"\e[0m: "^0.11.0",
            "phpunit/phpunit": "^7"
        }
    }
  EOS

  block <<-EOS
    use PHPUnit\Framework\TestCase;
    use \e[1mEris\Generator\e[0m;
    use \e[1mEris\TestTrait\e[0m;

    final class DeveloperTest extends TestCase
    {
      \e[1muse TestTrait\e[0m;

      [next slide]
    }
  EOS

  block <<-EOS
    use \e[1mEris\Generator\e[0m;
    public function testPositiveDeveloper...(): void
    {
      $this->\e[1mforAll\e[0m(
        \e[1mGenerator\\names()\e[0m,
        \e[1mGenerator\\int()\e[0m
      )
      ->then(function ( \e[1m$name\e[0m, \e[1m$number\e[0m ) {
        $developer = \e[1mnew Developer( $name, $number )\e[0m;
        $this->assertGreaterThanOrEqual(
          0,
          \e[1m$developer->getMaxibonsToGrab()\e[0m,
          "Developer should always \e[1mbe positive!!\e[0m");
      });
    }
  EOS
end


section "PBT en Elixir: \e[1mStreamData\e[0m" do
  center <<-EOS
    nando/\e[1mmaxibon_kata_elixir\e[0m
  EOS

  block <<-EOS
    en nuestro \e[31;1mmix.exs\e[0m:
    ────────────────────────────────────────────
    defp \e[1mdeps\e[0m do
      [
        [...]
        { \e[1m:stream_data\e[0m, "~> 0.1", \e[1monly: :test\e[0m },
        [...]
      ]
    end
  EOS

  block <<-EOS
    defmodule DeveloperTest do
      use \e[1mExUnit.Case, async: true\e[0m
      use \e[1mExUnitProperties\e[0m
      use \e[1mStreamData\e[0m

      property "assigns the right dvlopr name" do
        \e[1mcheck all name\e[0m <- string(:alphanumeric,
                                 min_length: 3 ),
                  \e[1mdev\e[0m = Developer.map( \e[1mname\e[0m ) do
          assert \e[1mdev.name == name\e[0m
        end
      end
      [...]
    end
  EOS

  block <<-EOS
    Generador (\e[31;1mtest/test_helper.exs\e[0m??):
    ───────────────────────────────
    def developer_generator do
      \e[1mgen all\e[0m name <- \e[1mstring\e[0m( :alphanumeric,
                              min_length: 3 ),
              maxibons_to_grab <- \e[1minteger()\e[0m do
            \e[1mDeveloper.map(name, maxibons_to_grab)\e[0m
          end
    end
  EOS

  block <<-EOS
    defmodule DeveloperTest do
      [...]

      property "always grab positive maxibons" do
        check all \e[1mdev <- developer_generator()\e[0m do
          assert dev.maxibons_to_grab >= 0
        end
      end
    end
  EOS

end

section "PBT en Python: \e[1mHypothesis\e[0m" do
  center <<-EOS
    nando/\e[1mMaxibonKataPython\e[0m
  EOS

  block <<-EOS
    \e[31;1mnuestra_clase_test.py\e[0m:
    
    from \e[1mhypothesis\e[0m import \e[1mgiven\e[0m
    from \e[1mhypothesis.strategies\e[0m import \e[1mintegers\e[0m,
                                      \e[1mtext\e[0m,
                                      \e[1msampled_from\e[0m
    [...]
  EOS

  block <<-EOS
    [...]
    \e[1m@given( text(), integers() )\e[0m
    def test_assign_name_and...(\e[1mname, mtg\e[0m):
        dev = Developer( \e[1mname, mtg\e[0m )
        assert \e[1mdev.name == name\e[0m
        assert \e[1mdev.maxibonsToGrab == mtg\e[0m
    [...]
  EOS

end

section "\e[1mThe Maxiconf Problem\e[0m" do
  center <<-EOS
    Karumi y The Cocktail traman

    la futura celebración de...
  EOS

  center <<-EOS
    \e[41;1m¡¡ LA MAXICONF !!\e[0m

  EOS

  center <<-EOS
    La única
    conferencia
    del mundo(\e[1m*\e[0m) con...

    \e[1m¡¡ barra libre     
         de Maxibons !!\e[0m

    \e[1m*\e[0m a 22 de enero de 2019(\e[1m**\e[0m)
    \e[1m**\e[0m Posiblemente... \e[1mxDDD\e[0m     
  EOS

  block <<-EOS
    \e[1mProblema\e[0m: en el congelador sólo entran

              MAX_MAXIBONS y para evitar que se

              derritan \e[1mnuestro orden de llegada

              es importante\e[0m. Y resulta que...
  EOS

  block <<-EOS
    \e[1m¡¡ con Hypothesis

    podemos conseguirlo !!\e[0m
  EOS

  block <<-EOS
    Lee la historia completa (\e[1my el código!!\e[0m):
    ──────────────────────────────────────────

    repo: nando/\e[1mMaxibonKataPython\e[0m

    rama: \e[1mmaxiconf_problem\e[0m

    file: \e[1mLEEME.md\e[0m
  EOS
end

section "Dedicated \e[1mto Mike Waters\e[0m <3<3<3" do
  block <<-EOS
    \e[1mGRACIAS!!\e[0m



    \e[31;1m...y hasta siempre @MardyB_!!\e[0m :__(
  EOS
end
