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

;%TXPKNO4^INT^1^59547,74032^0
%TXPKNO4 ;;05:14 PM  24 Sep 1993; 09 Feb 93 10:26 AM ; 24 Sep 93  5:16 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
RECUP() 
 K @(GPRODL)
 S ATELIER=""
UNNXAT S ATELIER=$O(@etuatg@(ATELIER)) Q:ATELIER="" 1
 I '($D(@etuat@("OPTIMUM"))) Q 0
 S NOEUD=@etuat@("OPTIMUM")
 S NBPERIOD=@NBPATE@(ATELIER)
 S ARTICLE=""
UNNXAR S ARTICLE=$O(@etuatag@(ARTICLE)) G:ARTICLE="" UNNXAT
 S qmh=$$^%QSCALIN(REPART,ARTICLE,"QUANTITE.FABRIQUEE.PAR.HEURE",1)
 S qmh=$S(qmh="":958E-1,1:qmh)
 I qmh=0 D ^%VZEAVT(ARTICLE_" : valeur de QUANTITE.FABRIQUE.PAR.HEURE illegale (0)") S qmh=1
 S qc=$$^%QSCALIN(REPART,ARTICLE,"CAPACITE.D.UN.CONTENEUR",1)
 S:qc="" qc=250
 
 I '($D(@GSTOCK@(ATELIER,ARTICLE,"INITIAL"))) S @GSTOCK@(ATELIER,ARTICLE,"INITIAL")=($$ATTSTA("STOCK.DISPONIBLE")\qc)*qc
 S (STOCK,STOCKI)=@GSTOCK@(ATELIER,ARTICLE,"INITIAL")
 
 I '($D(@GSTOCK@(ATELIER,ARTICLE,"ENCOURS"))) S @GSTOCK@(ATELIER,ARTICLE,"ENCOURS")=(($$ATTSTA("NOMBRE.DE.KITS.EN.STOCK")+$$ATTSTA("STOCK.EN.COURS"))\qc)*qc
 S STOCKENC=@GSTOCK@(ATELIER,ARTICLE,"ENCOURS")
 
 F t=1:1:NBPERIOD S VPROD=$$PULLMAT^%TXPPRIM(ARB,NOEUD,"Q",t,ARTICLE) D PROD
 
 S @GSTOCK@(ATELIER,ARTICLE,"INITIAL")=STOCKI
 S @GSTOCK@(ATELIER,ARTICLE,"ENCOURS")=STOCKENC
 G UNNXAR
 
PROD S PRDPROPA=VPROD
 I STOCKENC>0 S PRDPROPA=$S(STOCKENC>VPROD:0,1:VPROD-STOCKENC),STOCKENC=STOCKENC-VPROD
 
 
 S @GPRODL@(ATELIER,ARTICLE,t,"PROD")=PRDPROPA
 S @GPRODG@(ATELIER,ARTICLE,t,"PROD")=$S('($D(@GPRODG@(ATELIER,ARTICLE,t,"PROD"))):VPROD,1:@GPRODG@(ATELIER,ARTICLE,t,"PROD")+VPROD)
 S @GPRODG@(ATELIER,ARTICLE,t,"PRODH")=$S('($D(@GPRODG@(ATELIER,ARTICLE,t,"PRODH"))):VPROD/qmh,1:@GPRODG@(ATELIER,ARTICLE,t,"PRODH")+(VPROD/qmh))
 S d=$S($D(@dmd@("Periode "_t)):@dmd@("Periode "_t),1:0)
 S d=$S((d#qc)=0:d,1:((d\qc)+1)*qc)
 S STOCK=(STOCK+VPROD)-d
 S @GSTOCK@(ATELIER,ARTICLE,"SORTIE",t)=$S($D(@GSTOCK@(ATELIER,ARTICLE,"SORTIE",t)):@GSTOCK@(ATELIER,ARTICLE,"SORTIE",t)+STOCK,1:STOCK)
 S:STOCK<STOCKI STOCKI=STOCK
 Q
ATTART(ATT) 
 N VAL S VAL=$$^%QSCALIN(REPART,ARTICLE,ATT,1) Q $S(VAL="":0,VAL<0:0,1:VAL)
 
ATTSTA(ATT) 
 N VAL S VAL=$$^%QSCALIN($$NOMINT^%QSF("STATION.DE.PRODUCTION"),ATELIER,ATT,ARTICLE) Q $S(VAL="":0,VAL<0:0,1:VAL)
 ;
 ;

