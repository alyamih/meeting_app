import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting_app/model/news_item.dart';
import 'package:meeting_app/pages/description_news_page.dart';
import 'package:meeting_app/theme.dart';
import 'package:meeting_app/theme_notifier.dart';
import 'package:meeting_app/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsItem> newsList = [
    NewsItem(
      title:
          'Hyundai’s Genesis brand is a dark horse in U.S. luxury vehicle market',
      text:
          'NEW YORK — When Hyundai Motor launched its Genesis luxury brand domestically in 2016, many were skeptical the South Korean automaker — recognized mainly for budget vehicles at the time — knew what it was doing. Among the skeptics were auto industry veterans Randy Parker and Claudia Marquez. Both were working for Nissan’s luxury Infiniti brand at the time and they’ve since made the leap over to Hyundai Group, with Parker leading the Hyundai brand in the U.S. “We both were looking at it like, ‘Oh, my God, how are these guys going to be able to make it?’ I mean, nothing against. It’s just complicated. A new brand in such a competitive set,” Marquez, who now leads Genesis in North America, told CNBC last week at the New York International Auto Show. Not only has Genesis made it, the brand has thrived to become a dark horse in the U.S. luxury market with unique styling, unexpected comfort and well-ranked quality. It’s done so with both gas-powered and electric vehicles.',
      image:
          'https://image.cnbcfm.com/api/v1/image/107396270-1712163886191-IMG_6511.jpg?v=1712163990&w=740&h=416&ffmt=webp&vtcrop=y',
    ),
    NewsItem(
      title:
          'Retailers like Peloton and Saks keep paying vendors late, signaling possible ‘financial distress’',
      text:
          'In the months before Bed Bath & Beyond declared bankruptcy last April, the former home goods titan was trapped in a crushing cycle. The retailer had been failing to pay its vendors on time, if at all. During the pivotal holiday season, some began requiring payment when goods were delivered or refusing orders altogether, which left Bed Bath unable to stock shelves.  Running low on cash and needing a strong holiday quarter, the retailer’s position — and in turn its relationship with vendors — only got worse. The cycle continued until the big boxer succumbed to bankruptcy, and was liquidated a few months later.  Similar dynamics accelerated the demise of other once-ubiquitous retailers, such as RadioShack and Toys R Us. While the factors that led to their downfalls varied, failing to pay vendors on time is often a sign of financial distress or an early indicator of bankruptcy risk, experts have told CNBC. Retailers including Peloton, Saks, Express and Bath & Body Works have often failed to pay their vendors on time in the last few months, according to new data from Creditsafe, a business intelligence platform that analyzes companies’ financial, legal and compliance risks. Plenty of companies, including many that are healthy, leave bills unpaid for weeks or months. But when companies have sudden fluctuations in unpaid bills, at the same time their sales fall or debts rise, late-payment rates help to build a picture of which businesses could face financial risks in the coming months and years if their operations don’t improve.',
      image:
          'https://image.cnbcfm.com/api/v1/image/107337400-1700591677668-gettyimages-1794696160-AFP_344B8RT.jpeg?v=1712233369&w=600&h=300&ffmt=webp&vtcrop=y',
    ),
    NewsItem(
      title:
          'Ford to delay all-electric SUV, truck to focus on offering hybrid vehicles across its lineup by 2030',
      text:
          'DETROIT – Ford Motor is delaying production of a new all-electric large SUV and pickup truck, as it shifts to offer hybrid options across its entire North American lineup by 2030. The Detroit automaker on Thursday said it will continue to invest in EVs, but it is postponing production of the three-row SUV at a plant in Canada to 2027 from its initial plan of 2025. The next-generation pickup, codenamed “T3,” is being pushed back from late 2025 to 2026. The shift in EV plans is the latest for Ford and the entire automotive industry as adoption has been slower than many expected and production costs remain high. Ford last year said it would delay or cancel \$12 billion in planned spending on new EVs due to the shifting market conditions as well as challenges to profitably building and selling the vehicles. The Ford brand ranked second in EV sales during the first quarter of this year behind Tesla, but the Detroit automaker as a company ranked third overall. Both Tesla and Hyundai, including Kia and Genesis, outsold Ford in EVs. “As the No. 2 EV brand in the U.S. for the past two years, we are committed to scaling a profitable EV business, using capital wisely and bringing to market the right gas, hybrid and fully electric vehicles at the right time,” Ford CEO Jim Farley said Thursday in a statement.',
      image:
          'https://image.cnbcfm.com/api/v1/image/107302668-1712244809271-107302668-16950769492020-02-19t042113z_244949505_rc2g3f9v446p_rtrmadp_0_autoshow-canada.jpg?v=1712244826&w=740&h=416&ffmt=webp&vtcrop=y',
    ),
    NewsItem(
      title:
          'Diabetes drug similar to Ozempic helped slow progression of Parkinson’s disease in small trial',
      text:
          'A highly popular class of drugs for diabetes and obesity is showing early potential to help patients with Parkinson’s disease, too. An older diabetes treatment called lixisenatide helped slow the progression of motor disability after 12 months in patients at an early stage of the condition, according to results from a small mid-stage trial published Wednesday. The drug, made by Sanofi, is a GLP-1 like Novo Nordisk’s blockbuster diabetes injection Ozempic and weight loss counterpart Wegovy.  Motor disability refers to symptoms such as tremors, stiffness and slowness of movement, which can make it difficult for patients to walk, talk and swallow. Researchers from France said larger and longer studies are needed to fully determine the efficacy and safety of Sanofi’s treatment in patients with the degenerative brain illness, including how long the benefits may last. Still, the results, published late Wednesday in The New England Journal of Medicine mark an encouraging step forward in the decades-long effort to tackle Parkinson’s disease. As many as half a million Americans have been diagnosed with the condition, which is characterized by nerve cell damage in the brain. The results also add to the long list of potential health benefits of GLP-1s, which have skyrocketed in demand over the last year for helping patients shed pounds and regulate their blood sugar. But more research is needed to determine whether newer iterations of GLP-1s from Novo Nordisk and Eli Lilly may also help Parkinson’s patients. ',
      image:
          'https://image.cnbcfm.com/api/v1/image/104140008-GettyImages-565784959.jpg?v=1712236145&w=740&h=416&ffmt=webp&vtcrop=y',
    ),
    NewsItem(
      title: 'EU antitrust regulators scrap probe into fashion designers',
      text:
          'BRUSSELS, April 5 (Reuters) - EU antitrust regulators have scrapped a two-year-long investigation into a group of fashion designers who had called for changes in sales periods and discounts, the European Commission said on Friday, citing "priority reasons".The competition watchdog raided several fashion companies in May 2022 on concerns that they may have taken part in a cartel to fix prices. It did not name the companies. The raids were prompted by an open letter issued in 2020 by some fashion designers which called for fundamental changes in the industry to make it more environmentally and socially sustainable, people with direct knowledge of the matter had told Reuters. Hundreds of companies around the world, including Dries Van Noten, Thom Browne, Proenza Schouler, Lane Crawford, Mary Katrantzou, Gabriela Hearst, Altuzarra and Missoni Group, had signed the open letter. "The European Commission has decided to close its preliminary investigation into this matter for priority reasons. The closure is not a finding of compliance or non-compliance of the conduct in question with EU competition rules," a Commission spokesperson said.',
      image:
          'https://www.reuters.com/resizer/v2/W2TQT3W6L5I53A3LK3SMRTI6BQ.jpg?auth=c09e6d0b7f21c0bf360ee488702198b8a0b2e990913de7fbd64ffbdc6cf0f0ae&width=960&quality=80',
    ),
    NewsItem(
      title: 'Morning Bid: Geopolitics, oil and payrolls make for a busy day',
      text:
          'A look at the day ahead in U.S. and global markets by Alun John. It is an unusual start to a first Friday of the month as, with Brent crude oil above \$90 a barrel and driving a risk-off tone in markets around the world, investors are not solely thinking about U.S. non-farm payrolls. Let\'s not overstate it. They still are thinking a lot about the always-crucial jobs data, due at 0830 ET (1330 GMT), but after all three main U.S. stock indexes fell by over 1% on Thursday, while Treasuries rallied, it is not the only thing on their minds. Overnight chin-stroking has pinned the blame for the risk-off tone on Brent crude, which settled at over \$90 dollars a barrel on Thursday for the first time since October on developments in the Middle East. It is holding above that level in the European morning. Israel is bracing for the possibility of a retaliatory attack for Monday\'s presumed Israeli air strike on an Iranian embassy. Israel has not claimed responsibility for the attack on Iran\'s embassy compound in Syria, which killed high-ranking Iranian military personnel.',
      image:
          'https://www.reuters.com/resizer/v2/W34XFW2YCRLGRFWQZ7QG4N372E.jpg?auth=be799292e7c1f9d599321ed0532312df5e155758c2633366390fe5a0fd395943&width=960&quality=80',
    ),
    NewsItem(
      title: 'Moderate slowdown in US job, wage growth expected in March',
      text:
          'WASHINGTON, April 5 (Reuters) - U.S. job growth likely slowed moderately in March, while wage gains remained elevated, suggesting the economy ended the first quarter on solid ground and potentially delaying anticipated interest rate cuts from the Federal Reserve this year. The Labor Department\'s closely watched employment report on Friday is also expected to show the unemployment rate remaining below 4% for 26 straight months, the longest such stretch since the late 1960s. The economy is outperforming its global peers, despite 525 basis points worth of rate hikes from the U.S. central bank since March 2022 to quell inflation. Economists say most businesses locked in lower borrowing costs prior to the Fed\'s tightening cycle, giving them some insulation from higher rates and allowing them to keep their workers. Household balance sheets are mostly healthy, helping to support consumer spending. The labor market has also benefited from a rise in immigration over the past year. "The labor market is still quite tight, but it also looks like it\'s loosening," said David Page, head of macro research at AXA Investment Managers in London. "We are used to the labor market loosening by demand falling and people losing their jobs. Thankfully, this time around that\'s not what\'s happening." Nonfarm payrolls likely increased by 200,000 jobs last month after rising 275,000 in February, economists said in a Reuters survey. Estimates ranged from 150,000 to 250,000. Easing financial conditions are boosting hiring in interest rate-sensitive industries like construction, where payrolls surged in February. Employment in sectors such as healthcare, leisure and hospitality as well as state and local government remain below pre-pandemic trends.',
      image:
          'https://www.reuters.com/resizer/v2/Y75DYEYSLFNPDER3O3IA37KIPE.jpg?auth=e1457856ee75199b60316d0cbfbc5fba8d8dbe1bfbcb2dc281a660e254452bd6&width=960&quality=80',
    ),
    NewsItem(
      title: 'Inside Big Tech\'s underground race to buy AI training data',
      text:
          'NEW YORK, April 5 (Reuters) - At its peak in the early 2000s, Photobucket was the world\'s top image-hosting site. The media backbone for once-hot services like Myspace and Friendster, it boasted 70 million users and accounted for nearly half of the U.S. online photo market. Today only 2 million people still use Photobucket, according to analytics tracker Similarweb. But the generative AI revolution may give it a new lease of life. CEO Ted Leonard, who runs the 40-strong company out of Edwards, Colorado, told Reuters he is in talks with multiple tech companies to license Photobucket\'s 13 billion photos and videos to be used to train generative AI models that can produce new content in response to text prompts. He has discussed rates of between 5 cents and \$1 dollar per photo and more than \$1 per video, he said, with prices varying widely both by the buyer and the types of imagery sought. "We\'ve spoken to companies that have said, \'we need way more,\' Leonard added, with one buyer telling him they wanted over a billion videos, more than his platform has. "You scratch your head and say, where do you get that?" Photobucket declined to identify its prospective buyers, citing commercial confidentiality. The ongoing negotiations, which haven\'t been previously reported, suggest the company could be sitting on billions of dollars\' worth of content and give a glimpse into a bustling data market that\'s arising in the rush to dominate generative AI technology.',
      image:
          'https://www.reuters.com/resizer/v2/HEQN5WLOUBOVRGRJE7C6DGKNVA.jpg?auth=2bd5d98de4a67b2703c9de477a551923d7f22cc1208ec9549b20a301f3961c37&width=480&quality=80',
    ),
    NewsItem(
      title: 'Why Japan is not giving up on fraught U.S. Steel deal',
      text:
          'TOKYO, April 5 (Reuters) - Days after President Joe Biden joined his election rival Donald Trump in voicing concern about a Japanese purchase of U.S. Steel, the manufacturer began touting the benefits of the deal on billboards near its factories from Alabama to Pennsylvania. The billboards may be the most public signs of what some Japanese officials say in private - that despite high hurdles, Nippon Steel (5401.T), opens new tab could still steer through the fraught \$15 billion acquisition of the iconic American manufacturer. The deal may well hinge on whether regulators avoid election-year politics by clearing the acquisition after Nov. 5, and, critically, on whether Nippon Steel can win over the influential United Steelworkers (USW) labour union. Opposition from the Pittsburgh-based union has far-reaching implications in an election year where Pennsylvania is seen as a key battleground state. The deal is effectively "on life support" after Biden\'s statement last month that U.S. Steel (X.N), opens new tab must remain domestically owned and operated, said David Boling, a former U.S. trade official in Japan who now works for consulting firm Eurasia Group. Investors seem to agree. Biden\'s comment, which followed Trump\'s pledge to block the deal if he wins the Nov. 5 election, sent shares in both companies tumbling. U.S. Steel shares last traded at \$41.10, well below the \$55 per share price Nippon Steel has offered.',
      image:
          'https://www.reuters.com/resizer/v2/UARA6SRKURLNHNNGYQL3ZAPYTI.jpg?auth=bf3c69d5531677846cb75912d4833a19b37883dd8984c88ff1478b7afdd8a8db&width=960&quality=80',
    ),
    NewsItem(
      title:
          'Why a near-miss cyberattack put US officials and the tech industry on edge',
      text:
          'WASHINGTON, April 5 (Reuters) - German software developer Andres Freund was running some detailed performance tests last month when he noticed odd behavior in a little known program. What he found when he investigated has sent shudders across the software world and drawn attention from tech executives and government officials. Freund, who works for Microsoft (MSFT.O), opens new tab out of San Francisco, discovered that the latest version of the open source software program XZ Utils had been deliberately sabotaged by one of its developers, a move that could have carved out a secret door to millions of servers across the internet. Security experts say it’s only because Freund spotted the change before the latest version of XZ had been widely deployed that the world was spared a digital security crisis. “We really dodged a bullet,” said Satnam Narang, a security researcher with Tenable who has been tracking the fallout from the find. “It is one of those moments where we have to wipe our brow and say, ‘We were really lucky with this one.’” The near-miss has refocused attention on the safety of open source software – free, often volunteer-maintained programs whose transparency and flexibility mean they serve as the foundation for the internet economy.',
      image:
          'https://www.reuters.com/resizer/v2/D2NGSPXAYJOZNLEB4A4XB6ZR44.jpg?auth=8fd974aada9690fcc3fd8860d22558d063349a0257e5d3cfe5accfb04c8e4ae2&width=480&quality=80',
    ),
    NewsItem(
      title: 'China’s Young People Are Giving Up on Saving for Retirement',
      text:
          'China wants young people to put money away for retirement. Tao Swift, an unemployed 30-year-old, is not interested in hearing it. “Retire with a pension?” he asked. “I don’t hold much hope that I can definitely get my hands on it.” Mr. Tao, who lives in the southern city of Chengdu, is not alone in thinking this way. On social media forums and among friends, young people are questioning whether to save for old age. Some are opting out, citing the shortage of jobs, low pay and their ambivalence about the future. Their skepticism betrays the enormous challenge for China’s leaders. Over less than three decades, the country has changed from a young society to an aging one. Seven straight years of plummeting births are pushing up the day when there will be fewer people working than retirees. The fast-changing demographic profile is putting tremendous strain on China’s existing underfunded pension system. An average retirement age of 54, among the lowest in the world, has made this stress more acute. A grinding economic slowdown, the worst since China embraced capitalism four decades ago, is leaving many people out of work or with little room to put money aside. China has passed a demographic Rubicon just as many other countries have before it. The problem of underfunded retirement programs is not unique to China, either. But China’s demographic and economic troubles are colliding, shaking confidence in the pension system.',
      image:
          'https://static01.nyt.com/images/2024/04/02/multimedia/00china-pension-01-bghm/00china-pension-01-bghm-superJumbo.jpg?quality=75&auto=webp',
    ),
    NewsItem(
      title: 'Traders Are Betting Millions That Trump Media Will Tumble',
      text:
          'Before former President Donald J. Trump’s social media company made its stock market debut, many investors were lining up to bet on its collapse. After the company’s share price plunged following an initial surge, the appetite to bet against the stock has grown even more ravenous. Trump Media & Technology Group, which trades under the ticker DJT, slipped on Wednesday to below \$50 per share, extending a steep decline this week that pulled the stock down from its high near \$80 and erased more than \$2 billion of market value. Trump Media is the most “shorted” special purpose acquisition vehicle in the country, according to the financial data company S3 Partners. Short-sellers bet that the price of a stock will fall. They do that by borrowing shares of a company and selling them into the market, hoping to buy them back later at a lower price, before returning the shares to the lender and pocketing the difference as profit. The demand to short Trump Media, the parent company of the social media platform Truth Social, is so great that stock lenders can charge enormous fees, making it hard for short-sellers to turn a profit unless the shares fall significantly. Still, there is a lot of interest in taking the bet.',
      image:
          'https://static01.nyt.com/images/2024/04/03/multimedia/03trumpmedia-short-hvgj/03trumpmedia-short-hvgj-superJumbo.jpg?quality=75&auto=webp',
    ),
    NewsItem(
      title:
          'Plan to Stash Pollution Beneath the Sea Could Save Money and Jobs',
      text:
          'century poet, the city of Ravenna and its environs along Italy’s Adriatic coast are also home to old-line industries like steel and fertilizer. The manufacturing plants are of little interest to the many tourists who help sustain the area’s economy, but these sites employ tens of thousands of people. The question is: For how long? The factories, like others in Europe, face increasing pressure from regulators to reduce the climate-altering gases that their operations produce. The worry is that rising costs from regulation will force them to close. “We are very scared about the future of our industries,” said Michele De Pascale, the mayor of Ravenna. “We have to reach this goal to reduce CO2 emissions, but we want to do it without destroying our industries,” he said. Italy’s energy giant, Eni, which has a large presence in Ravenna, is pushing a plan that the mayor says could help preserve the region’s heavy industries: create an industrial pollution collector. The company is proposing to construct a network of pipelines to sweep up the carbon dioxide from the sites and store it away in old natural gas reservoirs. It sees this process, known as carbon capture and storage, as a promising new business line that would aid its shift to cleaner activities.',
      image:
          'https://static01.nyt.com/images/2024/04/04/multimedia/04Italy-carboncapture-01-qzjc/04Italy-carboncapture-01-qzjc-superJumbo.jpg?quality=75&auto=webp',
    ),
    NewsItem(
      title: '2 Brothers in Trump Media Insider-Trading Scheme Plead Guilty',
      text:
          'Two brothers from Miami pleaded guilty on Wednesday in federal court in Manhattan for their role in a nearly \$23 million insider-trading scheme surrounding the 2021 announcement that former President Donald J. Trump’s social media company planned to merge with a cash-rich shell company. Michael and Gerald Shvartsman, who had pleaded not guilty to securities fraud charges last summer, were set to go on trial later this month. But the brothers decided this week to forgo a trial, instead entering their guilty pleas before Judge Lewis J. Liman of U.S. District Court for the Southern District of New York. Each man pleaded guilty to one count of securities fraud. Michael Shvartsman, according to federal prosecutors, was the mastermind of the scheme to profit from the announcement, in October 2021, that Trump Media & Technology Group planned to merge with Digital World Acquisition Corporation, a shell company that had just raised \$300 million in an initial public offering. The authorities charged Michael Shvartsman, 53, a Miami financier, with making \$18.2 million in illicit trading profits; and his brother, 46, who owns an outdoor furnishing store in Miami, with raking in \$4.6 million. Michael Shvartsman, who ran a venture investment firm called Rocket One, used some of the proceeds from the scheme to buy a \$14 million luxury yacht that he named Provocateur. The brothers each face prison sentences of up to 20 years. Their plea agreements with the government recommend a sentence of roughly four to five years for Michael Shvartsman; and three to four years for Gerald Shvartsman.',
      image:
          'https://static01.nyt.com/images/2024/04/02/multimedia/00trumpmedia-insidertrading-gwmq/00trumpmedia-insidertrading-gwmq-superJumbo.jpg?quality=75&auto=webp',
    ),
    NewsItem(
      title: 'Ford Slows Its Push Into Electric Vehicles',
      text:
          'Ford Motor on Thursday delayed the production of at least two new electric cars and said it would pivot to making more hybrids. Its decision was the latest sign that large automakers have been forced to rethink their strategy for electric vehicles because sales for those models are slowing. The shift by Ford and automakers like General Motors and Mercedes-Benz, which have also pushed back their electric car plans, has been prompted largely by the companies’ difficulties in making and selling enough electric cars and doing so profitably. Sales of such vehicles are still growing, but the pace has slowed sharply in recent months as automakers have tapped out many of the early adopters who were willing to spend more than \$50,000 on a new battery-powered car. Because they are still learning how to make the cars and their batteries at lower cost, the companies have not been able to bring out more affordable models. “Many companies rushed in too fast with E.V.s that were too expensive and there was not as much of a market for them as they thought,” Sam Abuelsamid, principal analyst for transportation and mobility at the research firm Guidehouse Insights, said. “That’s made it a lot tougher to sell those vehicles.”',
      image:
          'https://static01.nyt.com/images/2024/04/05/multimedia/04ford-evs-pvmg/04ford-evs-pvmg-superJumbo.jpg?quality=75&auto=webp',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).currentTheme ==
              ThemeClass.lightTheme
          ? const Color(0xFFEBF5ED)
          : const Color(0xFF1E2321),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 65, 16, 20),
            child: Row(
              children: [
                Text(
                  'News',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Provider.of<ThemeProvider>(context).currentTheme ==
                              ThemeClass.lightTheme
                          ? Colors.black
                          : Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [getNews()],
              ),
            )),
          ),
          const BottomBar()
        ],
      ),
    );
  }

  Widget getNews() {
    List<Widget> list = [];
    for (var news in newsList) {
      list.add(Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => DescriptionNewsPage(
                        news: news,
                        newsList: newsList,
                      )),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context).currentTheme ==
                        ThemeClass.lightTheme
                    ? const Color(0xFFC8ECD2)
                    : const Color(0xFF2E3B37),
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 107,
                  width: 139,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            news.image!,
                          ))),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                news.title!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    fontSize: 18,
                                    color: Provider.of<ThemeProvider>(context)
                                                .currentTheme ==
                                            ThemeClass.lightTheme
                                        ? const Color(0xFF1E2321)
                                        : const Color(0xFFEBF5ED),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              news.text!,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  fontSize: 13,
                                  color: Provider.of<ThemeProvider>(context)
                                              .currentTheme ==
                                          ThemeClass.lightTheme
                                      ? const Color(0xFF1E2321)
                                      : const Color(0xFFEBF5ED),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    }
    return Column(
      children: list,
    );
  }
}
