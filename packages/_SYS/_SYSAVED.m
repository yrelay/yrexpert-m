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

;%SYSAVED^INT^1^59547,73892^0
SYSAVED ;
 N HOST,SYS
 S HOST=$$TABID^%INCOIN("ORDINATEUR")
 S SYS=""
 I HOST="VAX" S SYS="^[""SYS$M""]SYS(""UCI"")"
 I HOST="PDP" S SYS="^[""MG""]SYS(""DIR"")"
 I SYS="" Q
LEC W !,!,!,!,!,"Desirez-vous avoir acces a la (M)ise a jour ou a l'(E)dition (CTRLA abandon) : " R *REP Q:REP<32  G:(REP'=77)&(REP'=69) LEC D @REP G LEC
 
77 
 
DIR W !,"Directory (C directory courant) : " R DIR Q:$A(DIR)<32  G:DIR["?" LDIR I DIR="C" D INT+1^%DIR K %ST S DIR=%DIR W " => ",%DIR
 I '($D(@SYS@(DIR))) W " ???" G DIR
GLO W !,!,?10,"? Liste",!,?10,"1 Ajout",!,?10,"2 Suppression",!,!,"Option : " R OPT G:$A(OPT)<32 DIR G:(OPT'="1")&((OPT'="2")&(OPT'="?")) GLO G:OPT["?" LGLO
GLO1 W !,"Global ",$S(OPT=1:"(TOUS)",1:""),": " R GLO G:$A(GLO)<32 GLO S $ZT="ERR"
NET I $E(GLO,1)="^" W *
 S @GLO=1 G @OPT
1 I $D(^%SAVE(DIR,GLO)) W " deja existant dans la liste " G GLO1
 S ^%SAVE(DIR,GLO)=1 G GLO1
2 I '($D(^%SAVE(DIR,GLO))) W " ???" G GLO1
 K ^%SAVE(DIR,GLO) G GLO1
LDIR W !,! S DIR="" F %U=1:1 S DIR=$O(@SYS@(DIR)) Q:DIR=""  W ?((%U-1)#4)*20,DIR W:(%U#4)=0 !
 G DIR
LGLO W !,! S GLO="" F %U=1:1 S GLO=$O(^%SAVE(DIR,GLO)) Q:GLO=""  W ?((%U-1)#4)*20,GLO W:(%U#4)=0 !
 G GLO
ERR W " ???" G GLO1
 
69 S DOLARI=$I D ZD^%QMDATE4
 
DIRE K IO,IOP W !,"Directory (C directory courant ; T tous) : " R DIR Q:$A(DIR)<32  G:DIR["?" LDIRE I DIR="C" D INT+1^%DIR K %ST S DIR=%DIR W " => ",%DIR D ^%IS,ED C IO G DIRE
 I DIR="T" G TOUS
 I '($D(@SYS@(DIR))) W " ???" G DIRE
 D ^%IS,ED C IO G DIRE
ED U IO W !,!,!,!,!,"            GLOBALS SAUVEGARDES SUR ",DIR,"  (",%DAT,")",!,!
 I '($D(^%SAVE(DIR))) W "AUCUN" G FED
 S GLO=-1 F GG=1:1 S GLO=$N(^%SAVE(DIR,GLO)) Q:GLO=-1  W GLO F BB=1:1:10-$L(GLO) W " "
FED W !,! H:(IO'=0)&(IO'=DOLARI) 3 Q
TOUS D ^%IS S DIR=-1 F DD=1:1 S DIR=$N(^%SAVE(DIR)) Q:DIR=-1  D ED I (IO=0)!(IO=DOLARI) W "[RETURN] " R *RET W !
 C IO G DIRE

