;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%DLNOMG2^INT^1^59547,73868^0
DLNOMG2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
REJALON(REP,LAN,STA,GL1,GL2) 
 N I,PREM,ATMAC,MES,ERREUR,II
 I VISU S MES=$$^%QZCHW("Recherche des elements a rejalonner") D MSG^%VZEATT(MES) S DX=$L(MES)+2
 S ATMAC=$$MACHINE^%DLCON2
 K @(GL1),@(GL2)
 S I="",ERREUR=0
 G:STA="" REJ2
BREJAL1 S I=$O(^[QUI]QUERY3(REP,LAN,I))
 G:I=STA REJ3
 I I="" S ERREUR=1 G FREJAL
 S PROF=$O(^[QUI]QUERY3(REP,LAN,I,"PROFONDEUR",""))
 G:PROF="" BREJAL1
 S P1=$P(PROF,","),P2=$P(PROF,",",2)
 S @GL1@(P1,P2)=0
 S @GL2@(P1,P2)=$P($O(^[QUI]QUERY3(REP,LAN,I,"DATE.JALON","")),",")
 G BREJAL1
 
REJ2 S II=I,I=$O(^[QUI]QUERY3(REP,LAN,I))
 I I="" S:II="" ERREUR=1 G FREJAL
REJ3 S PROF=$O(^[QUI]QUERY3(REP,LAN,I,"PROFONDEUR",""))
 G:PROF="" REJ2
 X XY W I
 S P1=$P(PROF,","),P2=$P(PROF,",",2)
 S @GL1@(P1,P2)=1
 I '($D(PREM(P1,P2))) S @GL2@(P1,P2)=$P($O(^[QUI]QUERY3(REP,LAN,I,"DATE.JALON","")),","),PREM(P1,P2)=""
 S NUMOP=$O(^[QUI]QUERY3(REP,LAN,I,"NUMERO.OPERATION",""))
 I NUMOP="" G REJ2
 S @GL1@(P1,P2,I)=NUMOP
 
 S CHARG=$$^%QSCALIN(REP,LAN,ATCHARG,I)
 I CHARG="" S ERR=18 G FIN
 S NOSEM=@GL2@(P1,P2)
 I NOSEM'="" S NOSEM=$$^%QMDAFFI(NOSEM,6),NOSEM=$E(NOSEM,5,6)_$E(NOSEM,2,3)
 S MAC=$$^%QSCALIN(REP,LAN,ATMAC,I)
 I MAC="" S ERR=17 G FIN
 S:'($D(REGIMAC(MAC))) REGIMAC(MAC)=$$REGIME^%DLCORCA(MAC) I REGIMAC(MAC)="" S REGIMAC(MAC)=$$REGSTAND^%QMDRUTI D INSERR2^%DLUTIL(" "_$$^%QZCHW("Machine")_" "_MAC,6,RES)
 S @GL1@(P1,P2,I,0)=MAC
 S @GL1@(P1,P2,I,1)=NUMOP
 S @GL1@(P1,P2,I,2)=CHARG
 S @GL1@(P1,P2,I,3)=NOSEM
 S @GL1@(P1,P2,I,4)=I
 G REJ2
 
FREJAL S:ERREUR ERR=27
 Q
 
FIN Q
 
PARTIEL 
 
 
 
 S DY=23
 I VISU S MSG=$$^%QZCHW("Rejalonnement sur la gamme de l'article")_" "_O D MSG^%VZEATT(MSG) S DX=$L(MSG)+2
 I $$VAIR^%QSGE5(REPA,O,LIENGA,GAM) S GA=GAM G PART1
 S GA=$$^%QSCALVA(REPA,O,LIENGA)
 I GA="" S ERR=26 G RETPAR
PART1 S QU=@RENOM@(NIV,NIVO,"QU")
 S BNI=$O(@GREJAL1@(NIV,NIVO,""))
 G:BNI="" RETPAR
 S BNI=@GREJAL1@(NIV,NIVO,BNI)
 
 S TMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 K @(TMP)
 S OP=$$CONCAS^%QZCHAD(TMP,"OPERAT")
 K OPVU
 S I="",II=0
BPC S I=$O(@GREJAL1@(NIV,NIVO,I))
 G:I="" PAR1
 S TIN=@GREJAL1@(NIV,NIVO,I)
 I VISU X XY W TIN
 I $D(OPVU(TIN)) S TIN=OPVU(TIN),@OP@(TIN,2)=@OP@(TIN,2)+@GREJAL1@(NIV,NIVO,I,2) G BPC
 S II=II+1
 S OPVU(TIN)=II
 S @OP@(II)=@GREJAL1@(NIV,NIVO,I)
 S J=""
BPC2 S J=$O(@GREJAL1@(NIV,NIVO,I,J))
 G:J="" BPC
 I J=3 S @OP@(II,3)="" G BPC2
 S @OP@(II,J)=@GREJAL1@(NIV,NIVO,I,J)
 G BPC2
PAR1 G:'($D(@OP@(1))) RETPAR
 S I="",COMPOSANT=O_","_GA,GO=$$GO^%DLCON2
 S TIN=$$CONCAS^%QZCHAD(TMP,"INTER")
 S REGIMAC=$$CONCAS^%QZCHAD(TMP,"REGIME")
BPART S I=$O(@OP@(I))
 G:I="" BPART2
 S @OP@(I)=$$^%QSCALIN(REPGAM,COMPOSANT,GO,@OP@(I,1))
 S MAC=@OP@(I,0)
 S:'($D(@REGIMAC@(MAC))) @REGIMAC@(MAC)=$$REGIME^%DLCORCA(MAC) I @REGIMAC@(MAC)="" S @REGIMAC@(MAC)=$$REGSTAND^%QMDRUTI D INSERR2^%DLUTIL(" "_$$^%QZCHW("Machine")_" "_MAC,6,RES)
 G BPART
BPART2 S TOT=0,ERR=0,ART=O,GAM=GA,REGMAC=REGIMAC,OPM=OPMOD
 D COMMUN^%DLJACT(LAN,OP,DEL1,DEL2,RES)
 
 
 
 
 G:ERR'=0 RETPAR
 D STOCK^%DLSTOCK(O,OPMOD,RES)
 S I=""
 F %I=0:0 S I=$O(@OPMOD@(I)) Q:I=""  S @OPMOD@(I,5)=NIVE,@OPMOD@(I,7)=COMPOSANT
 S I=$ZP(@OPMOD@(""))
RETPAR K OPVU
 K @(TMP)
 G @ADRT
 
 
 
 
 
 
 
 
 
 
INIT(REPLA,LANC) 
 D:VISU MSG^%VZEATT($$^%QZCHW("Initialisation du lancement"))
 G:MODEX=0 INITRT
 D STATT^%TLBAATT(REPLA,LANC,$$DELNEC^%DLCON2,"","*","SUPPRESSION")
 D STATT^%TLBAATT(REPLA,LANC,$$DATEJAL^%DLCON2,"","*","SUPPRESSION")
 D STATT^%TLBAATT(REPLA,LANC,$$CHARGAR^%DLCON2,"","*","SUPPRESSION")
 D STATT^%TLBAATT(REPLA,LANC,$$MACHINE^%DLCON2,"","*","SUPPRESSION")
 D STATT^%TLBAATT(REPLA,LANC,$$DUJAL^%DLCON2,"","*","SUPPRESSION")
 D STATT^%TLBAATT(REPLA,LANC,"NUMERO.OPERATION","","*","SUPPRESSION")
 D STATT^%TLBAATT(REPLA,LANC,"OPERATION","","*","SUPPRESSION")
 D STATT^%TLBAATT(REPLA,LANC,"ARTICLE.JALONNE","","*","SUPPRESSION")
 D STATT^%TLBAATT(REPLA,LANC,"PROFONDEUR","","*","SUPPRESSION")
 D STATT^%TLBAATT(REPLA,LANC,"NB.JOURS.DECALAGE","","*","SUPPRESSION")
INITRT D PSV^%QSGESTI(REPLA,LANC,$$DELNEC^%DLCON2)
 D PSV^%QSGESTI(REPLA,LANC,$$DATEJAL^%DLCON2)
 D PSV^%QSGESTI(REPLA,LANC,$$CHARGAR^%DLCON2)
 D PSV^%QSGESTI(REPLA,LANC,$$MACHINE^%DLCON2)
 D PSV^%QSGESTI(REPLA,LANC,$$DUJAL^%DLCON2)
 D PSV^%QSGESTI(REPLA,LANC,"NUMERO.OPERATION")
 D PSV^%QSGESTI(REPLA,LANC,"OPERATION")
 D PSV^%QSGESTI(REPLA,LANC,"ARTICLE.JALONNE")
 D PSV^%QSGESTI(REPLA,LANC,"PROFONDEUR")
 D PSV^%QSGESTI(REPLA,LANC,"NB.JOURS.DECALAGE")
 Q
 ;

