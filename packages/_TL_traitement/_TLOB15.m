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

;%TLOB15^INT^1^59547,74030^0
%TLOB15 ;;07:04 PM  7 Jun 1993; ; 19 Nov 93  3:37 PM
 
 
 
 
 
 
 
 
 
TXTNOTE(IDEB,NBREG) 
 N INOT,NOMAT,II,IJ,REPC,INDC,%I,TX,ETX,LG,LL
 
 S REPC=PARCO("REP"),INDC=PARCO("IND")
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Conversion d'une note en attribut"))
 
 S INOT=V(IDEB)
 
 S NOMAT=V(IDEB+1)
 S LG=$S(NBREG<3:80,V(IDEB+2)=$C(0):80,1:V(IDEB+2))
 S IJ=0,II="" F %I=0:0 S II=$O(^[QUI]QUERYT(REPC,INDC,INOT,"LIGNE",II)) Q:II=""  S TX=^[QUI]QUERYT(REPC,INDC,INOT,"LIGNE",II) F LL=1:LG S ETX=$E(TX,LL,(LL+LG)-1) Q:ETX=""  S IJ=IJ+1 D PA^%QSGESTI(REPC,INDC,NOMAT,ETX,IJ)
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
POINTCOL(IDEB,NBREG) 
 N OBJ,VERS,NPT,XP,YP
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Maj d'un point d'1 collection"))
 
 S COL=V(IDEB)
 
 S VERS=V(IDEB+1)
 
 S NPT=V(IDEB+2)
 
 S XP=V(IDEB+4)
 
 S YP=V(IDEB+5)
 
 D POINT^%SDCCMS(COL,VERS,NPT,XP,YP) ;;*
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Point")_" "_NPT_" "_$$^%QZCHW("mis a jour"))
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
EQUIV(IDEB,NBREG) 
 Q:V(IDEB+4)=$C(0) ""
 Q:'($D(^[QUI]RQQ(V(IDEB+2),V(IDEB),V(IDEB+4),V(IDEB+5)))) V(IDEB+4)
 Q $P(^[QUI]RQQ(V(IDEB+2),V(IDEB),V(IDEB+4),V(IDEB+5)),"^",1)
 
MKGLO S ^%RQSGLO("VERBE","OBJ","$EQUIVALENT","ADRESSE.DE.LA.ROUTINE",1)="$$EQUIV^%TLOB15"
 S ^%RQSGLO("VERBE","OBJ","$EQUIVALENT","FORME.GENERIQUE",1)="VERBL2"
 S ^%RQSGLO("VERBE","OBJ","$EQUIVALENT","NATURE.PARAMETRE",1)="ATT"
 S ^%RQSGLO("VERBE","OBJ","$EQUIVALENT","NATURE.PARAMETRE",2)="EXPR"
 Q
 
 
 
 
 
 
 
 
 
 
 
 
GROUPER(IDEB,NBREG) 
 N LRES,RES,TIMOUT,VALRES
 S VALRES=$$^%QSCALIN("%",$J,V(IDEB),1)
 
 S TIMOUT=$S(NBREG<6:^TOZE($I,"ATTENTE"),V(IDEB+5)=$C(0):^TOZE($I,"ATTENTE"),1:V(IDEB+5))
 S LRES=$$INT^%QGPROG3(V(IDEB+1),$S(NBREG<3:"",V(IDEB+2)=$C(0):"",1:V(IDEB+2)),$S(NBREG<4:"",V(IDEB+3)=$C(0):"",1:V(IDEB+3)),$S(NBREG<5:$$^%QZCHW("Groupage"),V(IDEB+4)=$C(0):$$^%QZCHW("Groupage"),1:V(IDEB+4)),VALRES,TIMOUT)
 D CLEPAG^%VVIDEO
 Q:LRES="" 0
 S RES=$$AJCXT^%TLOPT(V(IDEB),"L0",LRES)
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
PLANIF(IDEB,NBREG) 
 N RES,TAB125,LIS,PREMP,DERP,DATREF,NIVMAX
 S TAB125=$$TEMP^%SGUTIL
 S LIS=V(IDEB),PREMP=V(IDEB+1),DERP=V(IDEB+2)
 S DATREF=$$GETINT^%TLOB8(V(IDEB+5),V(IDEB+3),V(IDEB+7),1)
 S NIVMAX=$S(NBREG<9:99999,V(IDEB+8)=$C(0):99999,1:V(IDEB+8))
 S @TAB125@("TAB125")="",@TAB125@("QUI")="",@TAB125@("WHOIS")="",@TAB125@("LIS")="",@TAB125@("PREMP")="",@TAB125@("DERP")="",@TAB125@("DATREF")="",@TAB125@("NIVMAX")=""
 D MEMX^%QCAMEM
 D KEXMEM^%QCAMEM(TAB125)
 D CURRENT^%IS,VARSYS^%QCSAP
 S RES=$$PLANIF^%TXPKNO1(LIS,PREMP,DERP,DATREF,NIVMAX)
 S @TAB125=RES
 K  D RMEMX^%QCAMEM
 S RES=@TAB125 Q RES
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SAISATT(IDEB,NBREG) 
 N REPC,INDC,CODC
 Q:(V(IDEB+3)'=1)&(V(IDEB+3)'=2) 1
 I V(IDEB+3)=1 S REPC=V(IDEB+8),INDC=V(IDEB+9),ATTC=V(IDEB+10) S:((REPC=$C(0))!(INDC=$C(0)))!(ATTC=$C(0)) (REPC,INDC,CODC)="" D SAISIE^%SRBATT1(V(IDEB),V(IDEB+1),V(IDEB+6),V(IDEB+7),V(IDEB+2),V(IDEB+4),V(IDEB+5),REPC,INDC,ATTC) Q 1
 S REPC=V(IDEB+10),INDC=V(IDEB+11),ATTC=V(IDEB+12) S:((REPC=$C(0))!(INDC=$C(0)))!(ATTC=$C(0)) (REPC,INDC,CODC)="" D SAISIE^%SRBATT2(V(IDEB),V(IDEB+1),V(IDEB+6),V(IDEB+7),V(IDEB+8),V(IDEB+9),V(IDEB+2),V(IDEB+4),V(IDEB+5),REPC,INDC,CODC) Q 1
 Q 1
 ;

