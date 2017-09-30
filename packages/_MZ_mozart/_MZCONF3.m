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

;%MZCONF3^INT^1^59547,73871^0
MZCONF3 ;
 
 
 
 
 
 
VERIF() 
 N TROU S TROU=0
 S CPT=2,%U=1
LOOP 
 S CPT=CPT+1
 Q:CPT>10 1
 I (((RESUL(%U)="")&(RESUL(%U+1)=""))&(RESUL(%U+2)=""))&(RESUL(%U+3)="") S TROU=1 G LOOP1
 I TROU D ^%VZEAVT("Il ne peut y avoir de ligne vide entre 2 lignes definies...") Q 0
 I RESUL(%U)="" D ^%VZEAVT("le libelle de la ligne "_CPT_" n'est pas defini") Q 0
 I RESUL(%U+1)="" D ^%VZEAVT("l'attribut de la ligne "_CPT_" n'est pas defini") Q 0
 I RESUL(%U+2)="" D ^%VZEAVT("l'indice de la ligne "_CPT_" n'est pas defini") Q 0
 I RESUL(%U+3)="" D ^%VZEAVT("le champ position de la ligne "_CPT_" n'est pas defini") Q 0
LOOP1 S %U=%U+5
 G LOOP
 
 
 
 
 
 
 
 
INDICE(LIMIT) 
 
 I RESUL(IC)'="" S REFUSE=$$IND1 Q
 Q:(RESUL(IC)="")&(RESUL(IC-1)="")
 I (RESUL(IC)="")&(RESUL(IC-1)'="") S REFUSE=1,TAB(ICC)=1 D AFFI^%MZCONF S RESUL(IC)=1,REFUSE=$$IND1 Q
 Q
IND1() 
 N LI,VV,OK,R S LI=(IC\LIMIT)+1,OK=1,R=$S(LIMIT=4:1,1:2)
 I (RESUL(IC-1)="MACHINE")!(RESUL(IC-1)="ACTION") S OK=$$IND2
 Q:'(OK) 1
 F VV=1:1:LI-1 I RESUL(2+(LIMIT*(VV-1)))=RESUL(IC-1),RESUL(3+(LIMIT*(VV-1)))=RESUL(IC) S OK=0 Q
 I '(OK) G DOUBLE
 F VV=LI+1:1:^%SCRE(SCR)/LIMIT I RESUL((LIMIT*VV)-(R+1))=RESUL(IC-1),RESUL((LIMIT*VV)-R)=RESUL(IC) S OK=0 Q
 I '(OK) G DOUBLE
 Q 0
IND2() 
 I RESUL(IC)=1 D ^%VZEAVT("L'indice de cet attribut ne peut-etre egal a 1") S REFUSE=1 Q 0
 Q 1
DOUBLE 
 D ^%VZEAVT("Il existe deja un indice "_RESUL(IC)_" pour l'attribut "_RESUL(IC-1)_" en ligne  "_$S(LIMIT=4:VV+1,1:VV+2)) Q 1
 
POS1() 
 N LI,VV,OK S LI=(IC\5)+1,OK=1
 F VV=1:1:LI-1 I RESUL(4+(5*(VV-1)))=RESUL(IC) S OK=0 Q
 I '(OK) G POS2
 F VV=LI+1:1:^%SCRE(SCR)/5 I RESUL((5*VV)-1)=RESUL(IC) S OK=0 Q
 I '(OK) G POS2
 Q 0
POS2 
 D ^%VZEAVT("La position "_RESUL(IC)_" a deja ete affectee en ligne "_(VV+2)) Q 1

