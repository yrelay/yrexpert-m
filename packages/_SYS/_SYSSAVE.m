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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 19/08/12 ! PB concaténer                                  !
;! HL003 ! HL     ! 19/08/12 ! NEW nspace                                     !
;! HL004 ! HL     ! 19/08/12 ! Sauvegarde des globals                         !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%SYSSAVE^INT^1^59547,74027^0
%SY3SAVE ;;02:19 PM  11 Jun 1992 ; 25 Jun 92  2:48 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
GO(GLO,FIC,PAR,COMMENT) 
 N IOF,G,%G,DCOUR
 S IOF=11
 
 I (GLO'="^%GSET(")_$J_")" K ^%GSET($J) S G="" F %G=0:0 S G=$O(@GLO@(G)) Q:G=""  S ^%GSET($J,G)=@GLO@(G)
 ;HL002 S DCOUR=$P($ZPOS,"^",2)SPACE
 ;HL003 ZN PAR
 ;HL004 O IOF:(MODE="W":FILE=FIC):10 E  G ERRGO
 ;HL004 D auto^%gsave(IOF,0,1,COMMENT)
 R "Fonction non implementee... voir %SYSUTIL1 [RETURN]",*TMP
 S $ZT=""
 ;HL004 C IOF
 ;HL003 ZN DCOUR
 Q 1
;HL002 ERRGO S $ZT="" C IOF ZN DCOUR Q 0
ERRGO S $ZT="" C FIC Q 0
 
 
GI(FIC,PAR)
 N IOF,DCOUR

 ;HL005 S IOF=11
 ;HL002 S DCOUR=$P($ZPOS,"^",2)SPACE
 ;HL003 ZN PAR
 ;HL004 O IOF:(MODE="R":FILE=FIC):10 E  G ERRGI
 ;HL004 D auto^%gload(IOF,0,1,"A",0,0)

 S IOF=FIC
 S DCOUR=$$DCOUR^%GTM()
 S ZN=$$ZGBLDIR^%GTM(PAR)
 O IOF:(readonly:exception="G ERRGI")
 U IOF:exception="G EOFGI"
 S GLO=""
 F  U IOF R LIG D 
 . I $E(LIG,1,2)="^(" S GLOL=LIG R LIG U $P W GLOL_"="_LIG,! S @($P($P(GLO,"^",2),"(")_"("_$P($P(GLO,"(",2),$RE($P($P($RE(GLO),"("),",")))_$P($P(GLOL,"(",2),")")_")")=LIG S LIG=""
 . I ($E(LIG)="^")&($E(LIG,1,2)'="^(") S GLO=LIG R LIG U $P W GLO_"="_LIG,! S @($P(GLO,"^",2))=LIG
EOFGI I '$ZEOF ZM +$ZS
 S $ZT=""
 C IOF
 U $P R "Restauration finie [RETURN]",*HL
 IF '$$ZGBLDIR^%GTM(DCOUR) W "Retour a la directory "_DCOUR_" impossible [RETURN]" R TMP,*HL
 Q 1

 ;HL004 C IOF
 ;HL003 ZN DCOUR
 ;Q 1
;HL003 ERRGI S $ZT="" C IOF ZN DCOUR Q 0
;HL004 ERRGI S $ZT="" C IOF Q 0
 ;

ERRGI S $ZT="",OKRET=0 I $P($ZS,",",1)=2 D  Q 0
 . W "Le fichier ",FIC," n'existe pas."
 I $P($ZS,",",1)=13 D  Q 0
 . W "Le fichier ",FIC," n'est pas accessible."
 ZM +$ZS
 Q 0



