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
;! Nomprog     : %SGMESU                                                      !
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
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%SGMESU ;
 
INIT 
 K ^MESURE($J)
 Q
DEB(CODE) S:'($D(^MESURE($J,CODE))) ^MESURE($J,CODE)=0,^MESURE($J,CODE,"NB")=0 S ^MESURE($J,CODE,"NB")=^MESURE($J,CODE,"NB")+1,^MESURE($J,CODE)=^MESURE($J,CODE)-$$gettime Q
 
FIN(CODE) S ^MESURE($J,CODE)=^MESURE($J,CODE)+$$gettime Q
 
gettime(x) 
 N mm,ll,ss,hh
 ;HL2 S hh=$P($ZT($P($ZTS,",",2),1,2),":")
 ;HL2 S mm=$P($ZT($P($ZTS,",",2),1,2),":",2)
 ;HL2 S ss=$P($P($ZT($P($ZTS,",",2),1,2),":",3),".")
 ;HL2 S ll=$P($P($ZT($P($ZTS,",",2),1,2),":",3),".",2)
 S hh=$P($ZD($H,"24:60:SS"),":",1)
 S mm=$P($ZD($H,"24:60:SS"),":",2)
 S ss=$P($ZD($H,"24:60:SS"),":",3)
 S ll=0
 
 Q (($P($H,",")*86400)+((((((hh*60)+mm)*60)+ss)*100)+ll))/100
  
 Q
 ;HL N mm,ll,ss,hh
 ;HL S x=$$gettime^%mdos,mm=$A(x,1),hh=$A(x,2),ll=$A(x,3),ss=$A(x,4)
 ;HL Q (($P($H,",")*86400)+((((((hh*60)+mm)*60)+ss)*100)+ll))/100
 
AFFI(DEV) 
 N TEMP,CO,%CO,A,%A,C,%C,B,%B,%L,LB,LC,TEMP2,TEMP3
 S TEMP=$$TEMP^%SGUTIL
 S TEMP2=$$TEMP^%SGUTIL
 S TEMP3=$$TEMP^%SGUTIL
 D ZD^%QMDATE4
 U DEV
 S CO="" F %CO=0:0 S CO=$O(^MESURE($J,CO)) Q:CO=""  S VALUNI=$J(^MESURE($J,CO)/^MESURE($J,CO,"NB"),"",2)+0 D AJTR
 W !," mesure du ",?20,%DAT,?50," sur ",?60,^INCONNE("INCA3","NOMHOST")
 W !," verbe ",?30," temps unitaire ",?50," # ",?70,"tps total"
 S %L=0
 S A="" F %A=0:0 S A=$ZP(@TEMP@(A)) Q:A=""  S LA=$$L(A),B="" F %B=0:0 S B=$ZP(@TEMP@(A,B)) Q:B=""  S LB=$$L(B),C="" F %C=0:0 S C=$O(@TEMP@(A,B,C)) Q:C=""  S LC=$$L(C) D LIG
 
 
 W !,!," ailleurs que ds les verbes ",?30," temps unitaire ",?50," # ",?70,"tps total"
 S %L=0
 S A="" F %A=0:0 S A=$ZP(@TEMP3@(A)) Q:A=""  S LA=$$L(A),B="" F %B=0:0 S B=$ZP(@TEMP3@(A,B)) Q:B=""  S LB=$$L(B),C="" F %C=0:0 S C=$O(@TEMP3@(A,B,C)) Q:C=""  S LC=$$L(C) D LIG3
 
 W !,!," precisions ",?30," temps unitaire ",?50," # ",?70,"tps total"
 S %L=0
 S A="" F %A=0:0 S A=$ZP(@TEMP2@(A)) Q:A=""  S LA=$$L(A),B="" F %B=0:0 S B=$ZP(@TEMP2@(A,B)) Q:B=""  S LB=$$L(B),C="" F %C=0:0 S C=$O(@TEMP2@(A,B,C)) Q:C=""  S LC=$$L(C) D LIG2
 K @(TEMP),@(TEMP2),@(TEMP3)
 U 0 Q
 
AJTR I $E(CO)="$" S @TEMP@(VALUNI,^MESURE($J,CO,"NB"),CO)=^MESURE($J,CO) Q
 I $E(CO)="*" S @TEMP3@(VALUNI,^MESURE($J,CO,"NB"),CO)=^MESURE($J,CO) Q
 S @TEMP2@(VALUNI,^MESURE($J,CO,"NB"),CO)=^MESURE($J,CO) Q
LIG W !,C,?23+LA,A,?43+LB,B,?63+$$L(@TEMP@(A,B,C)),@TEMP@(A,B,C)
 S %L=%L+1 I %L=20 S %L=0 I DEV=0 D ^%VZEAVT("")
 Q
LIG2 
 W !,C,?23+LA,A,?43+LB,B,?63+$$L(@TEMP2@(A,B,C)),@TEMP2@(A,B,C)
 S %L=%L+1 I %L=20 S %L=0 I DEV=0 D ^%VZEAVT("")
 Q
LIG3 
 W !,C,?23+LA,A,?43+LB,B,?63+$$L(@TEMP3@(A,B,C)),@TEMP3@(A,B,C)
 S %L=%L+1 I %L=20 S %L=0 I DEV=0 D ^%VZEAVT("")
 Q
 
L(X) Q 10-$S('($F(X,".")):$L(X),1:$L($P(X,".")))

