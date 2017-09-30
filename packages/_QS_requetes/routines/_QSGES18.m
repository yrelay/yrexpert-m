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

;%QSGES18^INT^1^59547,73881^0
QSGES18 ;
 
 
 
 
 
 
 
 
 
SUP(BASE,IND) 
 N LIENS,LIEN,J,I,OR,BASED,ATT,NOMF,K,OR1,TYP,VA,TY,TEMP,TYPL,CLE
 S LIENS=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LIENS")
 S CLE=$S($D(@LIENS):$O(@LIENS@("")),1:0)+1
 S LIENS=$$CONCAS^%QZCHAD(LIENS,CLE) K @(LIENS)
 
 D LIENS^%QSGEST9(BASE,IND,LIENS)
 S LIEN=""
BOUC 
 S LIEN=$O(@LIENS@(LIEN)) G:LIEN="" FSUP
 S BASED=$$REPD^%QSGEL2(BASE,LIEN),TYP=$$TYPE^%QSGEST9(BASE,LIEN),ATT=$$LIENI^%QSGEL2(BASE,BASED,LIEN,TYP)
 S OR=""
 
SU1 S OR=$O(@LIENS@(LIEN,OR)) G:OR="" BOUC
 S TYPL=@LIENS@(LIEN)
 I TYPL=3 D SUPS^%QSGEST3(BASE,IND,LIEN,BASED,@LIENS@(LIEN,OR)) G SU1
 I TYPL=2 D OSUPS^%QSGEST3(BASE,IND,OR,LIEN,BASED,@LIENS@(LIEN,OR)) G SU1
 I TYPL=4 D SUPS^%QSGEST3(BASE,IND,LIEN,BASED,@LIENS@(LIEN,OR)) G SU1
 I TYPL=5 D SUPS^%QSGEST3(BASED,@LIENS@(LIEN,OR),ATT,BASE,IND) G SU1
 I TYPL=0 G SU1
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"SU2")
 K @(TEMP),VA,TY
 D MVG^%QSCALVA(BASED,@LIENS@(LIEN,OR),ATT,TEMP,.TY)
 S NOMF=$$NOMEX^%QSGES10(BASE,IND)
 S OR1=$O(@TEMP@(""))
 F K=0:0 Q:OR1=""  Q:@TEMP@(OR1)=NOMF  S OR1=$O(@TEMP@(OR1))
 K @(TEMP)
 G:OR1="" SU1
 I TYPL=1 D OSUPS^%QSGEST3(BASED,@LIENS@(LIEN,OR),OR1,ATT,BASE,NOMF)
 G SU1
 
FSUP K @(LIENS)
 D PSA^%QSGESTI(BASE,IND)
 Q
 
 
 ;;  ATTENTION :mettre des @ davant LIENS
 S LIEN=$O(LIENS("")),BASED=$$REPD^%QSGEL2(BASE,LIEN),TYP=$$TYPE^%QSGEST9(BASE,LIEN),ATT=$$LIENI^%QSGEL2(BASE,BASED,LIEN,TYP)
 F I=0:0 Q:LIEN=""  D S1 S LIEN=$O(LIENS(LIEN)),BASED=$$REPD^%QSGEL2(BASE,LIEN),TYP=$$TYPE^%QSGEST9(BASE,LIEN),ATT=$$LIENI^%QSGEL2(BASE,BASED,LIEN,TYP)
 D PSA^%QSGESTI(BASE,IND)
 Q
S1 S OR=$O(LIENS(LIEN,""))
 F J=0:0 Q:OR=""  D S2 S OR=$O(LIENS(LIEN,OR))
 Q
S2 I LIENS(LIEN)=3 D SUPS^%QSGEST3(BASE,IND,LIEN,BASED,LIENS(LIEN,OR)) Q
 I LIENS(LIEN)=2 D OSUPS^%QSGEST3(BASE,IND,OR,LIEN,BASED,LIENS(LIEN,OR)) Q
 I LIENS(LIEN)=4 D SUPS^%QSGEST3(BASE,IND,LIEN,BASED,LIENS(LIEN,OR)) Q
 I LIENS(LIEN)=0 Q
 N VA,TY,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"SU2")
 K @(TEMP)
 D MVG^%QSCALVA(BASED,LIENS(LIEN,OR),ATT,TEMP,.TY)
 S NOMF=$$NOMEX^%QSGES10(BASE,IND)
 S OR1=$O(@TEMP@(""))
 F K=0:0 Q:OR1=""  Q:@TEMP@(OR1)=NOMF  S OR1=$O(@TEMP@(OR1))
 K @(TEMP) Q:OR1=""
 D OSUPS^%QSGEST3(BASED,LIENS(LIEN,OR),OR1,ATT,BASE,NOMF)
 Q

