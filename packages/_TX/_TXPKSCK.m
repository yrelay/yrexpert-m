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

;%TXPKSCK^INT^1^59547,74032^0
%TXPKSCK ;;12:01 PM  26 Jan 1993; 08 Jan 93  4:47 PM ; 11 Jan 93  4:43 PM
 
 
 
 
SAISCSTO(LISART,NBPERIOD) 
 N VU,ENSATE
 S VU=$$TEMP^%SGUTIL,ENSATE=$$TEMP^%SGUTIL
 D CONSART(LISART,VU,ENSATE)
 D CSTO(VU)
 Q
 
 
 
 
 
CONSART(LISART,VU,ENSATE) 
 N REPART,REPATE,REPDMD,ART,ATE,GLOATEL,IPERIO,DEM
 N EXIDEM,ALLDEM,PMAX,I,PER,RCR,MSG,NOMLIEN
 N PILE,IPILE,VU
 S REPART=$$NOMINT^%QSF("ARTICLE"),REPDMD=$$NOMINT^%QSF("DEMANDE")
 S REPATE=$$NOMINT^%QSF("STATION.DE.PRODUCTION")
 S PILE=$$TEMP^%SGUTIL,VU=$$TEMP^%SGUTIL
 S ART="",@PILE=0
 F %A=0:0 S ART=$$SUIVL^%QS0XG1(LISART,ART) Q:ART=""  S @PILE=@PILE+1,@PILE@(@PILE)=ART,@VU@(ART)=""
 S IPIL=""
PNOM S IPIL=$O(@PILE@(IPIL)) Q:IPIL=""
 S ART=@PILE@(IPIL)
 S ATE=$$^%QSCALVA(REPART,ART,"SE.FABRIQUE.A") S:ATE'="" @ENSATE@(ATE)=""
 S L="" F %L=0:0 S L=$$NXTRIAO^%QSTRUC8(REPART,ART,NOMLIEN,L) Q:L=""  I '($D(@VU@(L))) S @PILE=@PILE+1,@PILE@(@PILE)=L,@VU@(L)=""
 G PNOM
 
 
 
CSTO(VU,NBPERIOD) 
 N ART
 S ART="" F %ART=0:0 S ART=$O(@VU@(ART)) Q:ART=""  D UNCSTO(ART,NBPERIOD)
 Q
 
 
UNCSTO(ART,PMAX) 
 N REPART,GSTO,e,em,eM
 S REPART=$$NOMINT^%QSF("ARTICLE")
 S e=$$TEMP^%SGUTIL,em=$$TEMP^%SGUTIL,eM=$$TEMP^%SGUTIL
 S vsm=$$^%QSCALIN(REPART,ART,"VALEUR.STANDARD.STOCK.MINI",1) S:vsm="" vsm=0
 S vsM=$$^%QSCALIN(REPART,ART,"VALEUR.STANDARD.STOCK.MAXI",1) S:vsM="" vsM=100000
 S titre="contrainte de niveau de stock pour "_ART
 F I=1:1:PMAX S v=$$^%QSCALIN(REPART,ART,"STOCK.MINI",I) S:v'="" @em@(I)=v S v=$$^%QSCALIN(REPART,ART,"STOCK.MAXI",I) S:v'="" @eM@(I)=v
 D MATRICE(e,em,eM,titre,vsm,vsM)
 F I=1:1:PMAX D PA^%QSGESTI(REPART,ART,"STOCK.MINI",@em@(I),I),PA^%QSGESTI(REPART,ART,"STOCK.MAXI",@eM@(I),I)
 Q
 
 
 
UNCPROD(ART,PMAX) 
 N REPART,GSTO,e,em,eM
 S REPART=$$NOMINT^%QSF("ARTICLE")
 S e=$$TEMP^%SGUTIL,em=$$TEMP^%SGUTIL,eM=$$TEMP^%SGUTIL
 S vsm=0,vsM=100000
 S titre="contrainte de niveau de production pour "_ART
 F I=1:1:PMAX S v=$$^%QSCALIN(REPART,ART,"PRODUCTION.MINI",I) S:v'="" @em@(I)=v S v=$$^%QSCALIN(REPART,ART,"PRODUCTION.MAXI",I) S:v'="" @eM@(I)=v
 D MATRICE(e,em,eM,titre,vsm,vsM)
 F I=1:1:PMAX D PA^%QSGESTI(REPART,ART,"PRODUCTION.MINI",@em@(I),I),PA^%QSGESTI(REPART,ART,"PRODUCTION.MAXI",@eM@(I),I)
 Q
 
MATRICE(e,em,eM,titre,vsm,vsM) 
 
 
 
 
 
 
 
 
 
 
 
 
 N MATAF,CARMAT,TAIPAG,MENG,%II,PAGECOUR,SEMDPAGE,PERDP,TAIPAGE
 N TAIPCOUR,IDBPAGE
 S MATAF=$$TEMP^%SGUTIL
 S CARMAT=$$TEMP^%SGUTIL
 S MENG=$$TEMP^%SGUTIL
 
 S @CARMAT@("NBC")=3,@CARMAT@("TITRE")=titre
 S @CARMAT@("CG")=30,@CARMAT@("LH")=5,@CARMAT@("NOMODC",1)=""
 
 
 F %II=1:1:PMAX S:'($D(@em@(%II))) @em@(%II)=vsm S:'($D(@eM@(%II))) @eM@(%II)=vsM
 S IDBPAGE=0,TAIPAGE=10,PAGECOUR=1,SEMDPAGE=1,PERDP=0
 
DEFMEN S @MENG="16^30^60"
 S @MENG@(1)=$$^%QZCHW("+")_"^PLUS",@MENG@(1,"COM")=$$^%QZCHW("page suivante"),@MENG@(2)=$$^%QZCHW("-")_"^MOINS",@MENG@(2,"COM")=$$^%QZCHW("page precedente")
 S @MENG@(3)=$$^%QZCHW("modifier")_"^MODIF",@MENG@(3,"COM")=$$^%QZCHW("modifier les valeurs de cette page"),@MENG@(4)=$$^%QZCHW("FIN")_"^FIN",@MENG@(4,"COM")=$$^%QZCHW("fin")
 
 D CLFEN^%VVIDEO(15,4,14,60)
 
AFF S TAIPCOUR=$S((PMAX-IDBPAGE)<TAIPAGE:PMAX-IDBPAGE,1:TAIPAGE)
 
 K @(MATAF) F %II=1:1:TAIPCOUR D MAKELIG
 
 S @CARMAT@("NBL")=TAIPCOUR D ^%PKPOPM(MATAF,CARMAT,0)
 
MEN D ^%VQUIKMN(30,80,17,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") FIN G:ADRES'="" @ADRES G MEN
 
MODIF D ^%PKPOPM(MATAF,CARMAT,1)
 
 F %ii=1:1:TAIPCOUR S @em@(%ii+IDBPAGE)=@MATAF@(%ii,2),@eM@(%ii+IDBPAGE)=@MATAF@(%ii,3)
 G MEN
 
PLUS I (IDBPAGE+TAIPAGE)'<PMAX D ^%VSQUEAK G MEN
 S IDBPAGE=IDBPAGE+TAIPAGE,PERDP=PERDP+TAIPAGE
 D CLFEN^%VVIDEO(15,4,13,60)
 G AFF
 
MOINS I IDBPAGE=0 D ^%VSQUEAK G MEN
 S IDBPAGE=IDBPAGE-TAIPAGE,PERDP=PERDP-TAIPAGE
 D CLFEN^%VVIDEO(15,4,13,60)
 G AFF
 
FIN K @(MATAF),@(CARMAT),@(MENG)
 D CLFEN^%VVIDEO(15,4,14,60)
 Q
 
 
MAKELIG 
 S @MATAF@(%II,1)="Periode "_(PERDP+%II)_$S($D(@e@(IDBPAGE+%II)):"("_@e@(IDBPAGE+%II)_")",1:"")
 S @MATAF@(%II,2)=@em@(IDBPAGE+%II)
 S @MATAF@(%II,3)=@eM@(IDBPAGE+%II)
 Q
 
 
 
 
CONTATE(ATE,PMAX) 
 N GLOB,GLODEFA,NBC,NBFIXH,NBFIXB,v,REPATE
 S REPATE=$$NOMINT^%QSF("STATION.DE.PRODUCTION")
 S GLOB=$$TEMP^%SGUTIL
 F I=1:1:PMAX S v=$$^%QSCALIN(REPATE,ATE,"PRODUCTION.MAXI",I) S:I'="" @GLOB@(I)=v
 S @GLOB@("Valeur Standard")=100000
 S GLODEFA=$$TEMP^%SGUTIL
 S TITRE=" Capacite maxi de "_ATE
 
 S NBC=10,NBFIXH=0,NBFIXB=0
 
 S @GLODEFA@("ROULIB")="$$vstoctr^%TXPKSCK"
 S @GLODEFA@("ROUDEF")="$$vdefctr^%TXPKSCK"
 S @GLODEFA@("ROUAFF")="$$vaffctr^%TXPKSCK"
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,PMAX)
 F I=1:1:PMAX D PA^%QSGESTI(REPATE,ATE,"PRODUCTION.MAXI",@GLOB@(I),I)
 Q
 
 
vstoctr(i) Q i
vdefctr(I) N V
 I I=1 S V=@GSUIV@("Valeur Standard") Q V
 I $D(@GSUIV@(I-1)) S V=@GSUIV@(I-1) Q V
 S V=@GSUIV@("Valeur Standard") Q V
 
vaffctr(i) Q "Periode "_i
 ;

