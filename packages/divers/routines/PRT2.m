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

;PRT2^INT^1^59547,74868^0
PRT2(PORT,MACH,ORDRE,PAR1,PAR2,PAR3) 
 
 N GLO,RESUL1,RESUL2,RESUL3
 N T1,T2,T3,T4,T5,T6,T7
 S GLO="^BALANCE"
 S (T1,T2,T3,T4,T5,T6,T7)=""
 D:MODAF'=0 ADD^%TLIFEN("LOG","   "_$$^%QZCHW("LECTURE ECRITURE SUR UN PORT EXTERNE"))
 I '($D(^%IS(PORT))) D ADD^%TLIFEN("LOG","   "_$$^%QZCHW("PORT EXTERNE NON RECONNU")) S ECHEC=1 Q
 I '($D(@GLO@(MACH))) D ADD^%TLIFEN("LOG","   "_$$^%QZCHW("MACHINE INCONNUE")) S ECHEC=1 Q
 I '($D(@GLO@(MACH,ORDRE))) D ADD^%TLIFEN("LOG","   "_$$^%QZCHW("ORDRE INCONNU")) S ECHEC=1 Q
 
 X @(@GLO@(MACH,ORDRE))
 
 Q:'($D(RESUL1))
 I $E(PAR1)'="%" D:MODAF'=0 ADD^%TLIFEN("LOG","   "_$$^%QZCHW("LE QUATRIEME PARAMETRE DOIT ETRE UNE VARIABLE TEMPORAIRE")) S ECHEC=1 Q
 D:MODEX=2 STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),PAR1,RESUL1,1,"AJOUT")
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),PAR1,RESUL1,1)
 D:MODAF'=0 ADD^%TLIFEN("LOG","   "_$$^%QZCHW(PAR1_"<--"_RESUL1))
 
 Q:'($D(RESUL2))
 I $E(PAR2)'="%" D:MODAF'=0 ADD^%TLIFEN("LOG","   "_$$^%QZCHW("LE CINQUIEME PARAMETRE DOIT ETRE UNE VARIABLE TEMPORAIRE")) S ECHEC=1 Q
 D:MODEX=2 STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),PAR2,RESUL2,1,"AJOUT")
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),PAR2,RESUL2,1)
 D:MODAF'=0 ADD^%TLIFEN("LOG","   "_$$^%QZCHW(PAR2_"<--"_RESUL2))
 
 Q:'($D(RESUL3))
 I $E(PAR3)'="%" D:MODAF'=0 ADD^%TLIFEN("LOG","   "_$$^%QZCHW("LE SIXIEME PARAMETRE DOIT ETRE UNE VARIABLE TEMPORAIRE")) S ECHEC=1 Q
 D:MODEX=2 STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),PAR3,RESUL3,1,"AJOUT")
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),PAR3,RESUL3,1)
 D:MODAF'=0 ADD^%TLIFEN("LOG","   "_$$^%QZCHW(PAR3_"<--"_RESUL3))
 Q
 
 
LIREMETT(PT,ORDRE,A1,A2,A3,A4,A5,A6,A7) 
 N I,MAX,CODER,TIMOUT,J,VX,NOK,MAXI,RES
 S MAX=7,CODER="ES",TIMOUT=1
 S $ZT="ERRMETT^PRT2"
 O PT::TIMOUT E  G ERRMETT
 S $ZT=""
 
 F I=1:1:MAX U PT R VX(I):TIMOUT E  Q
 
 U PT W !,ORDRE,!
 
 S NOK=0 F I=1:1:MAX U PT R RES(I):TIMOUT E  S NOK=1 Q
 
 S MAXI=I-NOK F J=1:1:MAXI S @("A"_J)=RES(J)
 I NOK F J=MAXI:1:MAX S @("A"_J)=""
 C PT
 Q
ERRMETT S $ZT="" F J=1:1:MAX S @("A"_J)=-1
 Q
 
INITGLO 
 S GLO="^BALANCE"
 S @GLO@("METTLER","TARE")="D ^LIREMETT(NUMPORT,""T"",T1,T2,T3,T4,T5,T6,T7) "
 S @GLO@("METTLER","POIDS")="D ^LIREMETT(NUMPORT,""S"",T1,T2,T3,T4,T5,T6,T7) S:$D(T3) RESUL1=T3"
 S @GLO@("METTLER","IDENT")="D ^LIREMETT(NUMPORT,""ID"",T1,T2,T3,T4,T5,T6,T7) S:$D(T3) RESUL1=T3 S:$D(T5) RESUL2=T5 S:$D(T7) RESUL3=T7"
 Q

