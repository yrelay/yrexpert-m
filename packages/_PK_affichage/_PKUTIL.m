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
;! Nomprog     : %PKUTIL                                                      !
;! Module      : PK                                                           !
;! But         : Utilitaire d'affichage.                                      !
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

;%PKUTIL^INT^1^59558,68096^0
%PKUTIL ;
 
 
 
 
 
 
 
 
 
 
 
 
VAL(DX,DY,LIB,LNG,X) 
 N Y,TO,%R,%C,%C1
 N %CH,%LCH,%ICH,%CACH
 D CLEAR^%SYSUTI1
 S %R=DY
 S %C1=(DX+4)+$L(LIB)
 S:LNG>78 LNG=78
 S:LNG=0 LNG=78-%C1
 S X=$E(X,1,LNG)
 S X=X_$J("",LNG-$L(X))
 S Y(1)=LIB,Y(2)=X
 S Y=DX_"\CYWHRL\2\\\"
 D PARAM^%PKPOP(.Y)
 S %C=%C1
 D:'($D(^%PKREAD)) READ^%PKGLOB
LEC X ^%PKREAD
 G:TO="ABAND" FINV
 G @("LECTRT"_(TO="RETURN"))
 
LECTRT0 
 G @("LECTRF"_(TO="ARRET"))
LECTRF0 
 X ^%PKREAD(7)
 G LEC
 
LECTRF1 
LECTRT1 
 X ^%PKREAD("BLANC")
 X ^%PKREAD("NORM")
 Q 1
 
FINV X ^%PKREAD("NORM")
 Q 0
 
MESS(DX,DY,LIB,BEL) 
 N %R,X,PK
 S %R=DY
 D CHGPK
 X:BEL ^%PKREAD(7)
 D PARAM^%PKPOP(DX_"\CHL\1\\\"_LIB)
 D RETMOD
 Q
 
ATT(DX,DY,LIB,MOD) 
 N %C,%R,X
 S %R=DY
 D CHGPK
 D PARAM^%PKPOP2(DX_"\CWD"_MOD_"\1\\\"_LIB,0)
 D RETMOD
 Q
 
CONFIRM(DX,DY,LARG,LIB) 
 N Y,LCOL1,LL,NLIG,%R,X
 Q:LARG<10 0 S LCOL1=LARG-10
 S LL=$S($L(LIB)<LCOL1:LIB_$J("",LCOL1-$L(LIB)),1:LIB)
 S NLIG=(($L(LL)+9)\LARG)+1
 F IL=1:1:NLIG S Y(IL)=$E(LL,1,LCOL1)_"*",Y(IL+NLIG)=$E(LL,LCOL1+1,LCOL1+5)_"*",Y(IL+(2*NLIG))=$E(LL,LCOL1+6,LCOL1+10)_"*",LL=$E(LL,LCOL1+11,$L(LL))
 S Y(NLIG*3)=" oui ",Y((NLIG*3)-NLIG)=" non "
 S %R=DY,Y=DX_"\CYHL\3\\\"
 D PARAM^%PKPOP2(.Y,1)
 Q:(CTR="A")!(CTR="F") 0 G:CTR'="" LEC
 Q:X=(NLIG*3) 1 Q 0
 
 
MODPK D CUROF^%VVIDEO X ^%PK("TERM-ON"),^%PK("ECHO-OFF"),^%PK("WRAP-OFF") Q
 
MODNORM X ^%PK("WRAP-ON"),^%PK("ECHO-ON"),^%PK("TERM-OFF") D CURON^%VVIDEO Q
 
 
 
CHGPK N MCOUR
 D:'($D(PK)) INIT^%PKDEV
 S MCOUR=$$GET^%SGVAR("MODPK") D SET^%SGVAR("MODPK",1)
 Q:MCOUR
 S PK(1)=0 D CUROF^%VVIDEO
 X ^%PK("TERM-ON")
 X ^%PK("ECHO-OFF")
 X ^%PK("WRAP-OFF")
 Q
 
CHGNORM N MCOUR
 S MCOUR=$$GET^%SGVAR("MODPK") D SET^%SGVAR("MODPK",0)
 Q:'(MCOUR)
 S PK(1)=1 X ^%PK("WRAP-ON"),^%PK("ECHO-ON"),^%PK("TERM-OFF") D CURON^%VVIDEO Q
 
 
RETMOD N MCOUR,MPRED
 D CLEAR^%SYSUTI1
 S MCOUR=$$GET^%SGVAR("MODPK") D DEP^%SGVAR("MODPK") S MPRED=$$GET^%SGVAR("MODPK")
 Q:MCOUR=MPRED
 I MPRED S PK(1)=0 D CUROF^%VVIDEO X ^%PK("TERM-ON"),^%PK("ECHO-OFF"),^%PK("WRAP-OFF") Q
 S PK(1)=1 X ^%PK("WRAP-ON"),^%PK("ECHO-ON"),^%PK("TERM-OFF") D CURON^%VVIDEO Q
 ;

